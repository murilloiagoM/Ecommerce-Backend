//import { isAuth } from "../middlewares/auth.js";
import dotenv from 'dotenv';
import crypto from 'crypto';
import jwt from "jsonwebtoken"
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { writeFile } from 'fs/promises';
import { adminuser, isAdmin, setAdmin } from '../middlewares/auth.js';

dotenv.config();

//eslint-disable-next-line no-undef
const secretKey = process.env.JWT_SECRET;
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const uploadsPath = join(__dirname, '..', 'uploads'); // Caminho para a pasta 'uploads'


function hashPassword(password) {
  const hash = crypto.createHash('sha256');
  hash.update(password);
  return hash.digest('hex');
}

const saveFile = async (file) => {

  const replaceAccents = (str) => {
    return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  };
  const newname = replaceAccents(file.filename.replace(/\s+/g, '-'));
  const timestamp = new Date().toISOString().replace(/[-:.]/g, ''); // timestamp
  const filename = `${timestamp}-${newname}`; // Novo nome
  const uploadPath = join(uploadsPath, filename); // Caminho completo do arquivo

  // Salva o arquivo
  await writeFile(uploadPath, await file.toBuffer());

  return uploadPath;
};

export async function postRoutes(app) {

  app.post('/typeuser', (req, reply) => {
    const { auth } = req.cookies;
    if (auth == adminuser) {
      reply.status(200).send({ success: true, user: 'admin' })
    } else {
      reply.status(200).send({ success: false, user: 'normal' })
    }
  })

  app.post('/novousuario', (req, reply) => {
    const { nome, email, senha } = req.body
    const hash = hashPassword(senha);

    app.mysql.query('SELECT COUNT(*) AS count FROM users WHERE email = ?', [email], (err, result) => {
      if (err) {
        console.log(err.message)
        return reply.status(403).send({
          sucess: false,
          message: "Erro ao verificar!"
        })
      } else {
        if (result[0].count == 0) {
          app.mysql.query('INSERT INTO users(nome, email, senha) VALUES (?, ?, ?)', [nome, email, hash], (err, result) => {
            if (err) {
              console.log(err.message)
              return reply.status(403).send({
                sucess: false,
                message: "Erro ao inserir!"
              })
            } else {
              console.log(`Dados inseridos! ${result.affectedRows} linhas afetadas.`);
              const token = jwt.sign({ email }, secretKey);
              if (email == "adminacc@email.com") {
                setAdmin(token)
              }
              return reply.status(200)
                .setCookie('auth', token, {
                  domain: 'localhost',
                  path: '/',
                  secure: false,
                  httpOnly: true,
                  sameSite: true
                })
                .send({
                  sucess: true,
                  message: "Cadastro realizado com sucesso",
                  user: nome
                })
            }
          })
        } else {
          return reply.status(401).send({
            sucess: false,
            message: "Erro ao verificar!"
          })
        }
      }
    });
  })

  app.post('/login', (req, reply) => {
    const { email, senha } = req.body
    const hash = hashPassword(senha);

    app.mysql.query('SELECT COUNT(*) AS count, nome, email FROM users WHERE email = ? AND senha = ?', [email, hash], (err, result) => {
      if (err) {
        console.log(err.message)
        return reply.status(403).send({
          sucess: false,
          message: "Erro ao verificar!"
        })
      } else {
        if (result[0].count == 1) {
          const token = jwt.sign({ email }, secretKey);
          if (email == "adminacc@email.com") {
            setAdmin(token)
          }
          return reply.status(200)
            .setCookie('auth', token, {
              domain: 'localhost',
              path: '/',
              secure: false, //true = apenas em HTTPS
              httpOnly: true,
              sameSite: true //Strict = para producao
            })
            .send({
              sucess: true,
              message: "Login efetuado com sucesso!",
              user: result[0].nome,
            })
        } else {
          return reply.status(401).send({
            sucess: false,
            message: "Dados incorretos!"
          })
        }
      }
    });
  })

  app.post('/logout', (req, reply) => {
    reply.clearCookie('auth', {
      path: '/',
      domain: 'localhost',
      secure: false,
      httpOnly: true
    });
    reply.status(200).send({
      success: true,
      message: 'Logout realizado com sucesso'
    });
  });

  app.post('/novoproduto', { onRequest: [isAdmin] }, async (req, reply) => {

    const parts = req.parts();
    let formData = {};
    let filePath = '';

    for await (const part of parts) {
      if (part.file) {
        // Salvar arquivo
        filePath = await saveFile(part);
      } else {
        // Adicionar outros campos ao formData
        formData[part.fieldname] = part.value;
      }
    }

    const { nome, categoria, subcategoria, tamanhos, parcelas, valorparcelas, valortotal, descricao, especificacoes } = formData;

    if (!nome || !categoria || !subcategoria || !tamanhos || !parcelas || !valorparcelas || !valortotal || !descricao || !especificacoes) {
      return reply.status(403).send({ error: 'Preencha todos os campos!' });
    }

    const fileName = filePath.split('\\').pop();

    app.mysql.query('INSERT INTO produtos(nome, categoria, subcategoria, parcelas, valorparcelas, valortotal, descricao, especificacoes, imagem, tamanhos) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [nome, categoria, subcategoria, parseInt(parcelas), parseFloat(valorparcelas), parseFloat(valortotal), descricao, especificacoes, fileName, tamanhos], (err, result) => {
        if (err) {
          console.log(err.message)
          return reply.status(403).send({
            success: false,
            message: "Erro ao inserir!"
          });
        } else {
          console.log(`Dados inseridos! ${result.affectedRows} linhas afetadas.`);
          return reply.status(200).send({ success: true });
        }
      });
  });

  app.post('/produtos/categorias', (req, reply) => {
    const { categorias, filtro, offset } = req.body;
  
    const newOffset = offset === "0" ? 0 : Number(offset) * 25;
    let whereClauses = [];
    let where = "";
    let ordem = "";
    let quantidade = "LIMIT 25";
  
    categorias.forEach(categoria => {
      const { nome, subcategorias } = categoria;
  
      if (subcategorias.includes('Tudo')) {
        whereClauses.push(`categoria = '${nome}'`);
      } else {
        let subcatClause = subcategorias.map(subcat => `subcategoria = '${subcat}'`).join(' OR ');
        whereClauses.push(`(categoria = '${nome}' AND (${subcatClause}))`);
      }
    });
  
    const whereQuery = whereClauses.join(' OR ');
  
    if (filtro !== "none") {
      switch (filtro) {
        case "low-price":
          ordem = "ORDER BY valortotal ASC";
          break;
        case "high-price":
          ordem = "ORDER BY valortotal DESC";
          break;
      }
    }
  
    if (whereQuery !== "") {
      where = `WHERE ${whereQuery}`;
    }
  
    if (newOffset !== 0) {
      quantidade = `${quantidade} OFFSET ?`;
    }
  
    app.mysql.query(`SELECT COUNT(*) FROM produtos ${where}`, [], (err, countResult) => {
      if (err) {
        console.log(err.message);
        return reply.status(500).send({
          success: false,
          message: "Erro ao verificar tamanho!"
        });
      } else {
        const query = `SELECT id, nome, categoria, subcategoria, descricao, especificacoes, parcelas, valorparcelas, valortotal, imagem, tamanhos FROM produtos ${where} ${ordem} ${quantidade}`;
        app.mysql.query(query, newOffset !== 0 ? [newOffset] : [], (err, result) => {
          if (err) {
            console.log(err.message);
            return reply.status(500).send({
              success: false,
              message: "Erro ao receber produtos!"
            });
          } else {
            let quantidade = countResult[0]['COUNT(*)'];
            let existemais = (newOffset + 25) < quantidade;
  
            return reply.status(200).send({
              success: true,
              produtos: result,
              more: existemais
            });
          }
        });
      }
    });
  });
  
  app.post('/busca', (req, reply) => {
    const { busca, filtro } = req.body;
  
    if (busca === "") {
      return reply.status(403).send({
        success: false,
        message: "String vazia!"
      });
    }
    let ordem = "";
    let arraybusca = busca.split(" ");

    if (filtro !== "none") {
      switch (filtro) {
        case "low-price":
          ordem = "ORDER BY valortotal ASC";
          break;
        case "high-price":
          ordem = "ORDER BY valortotal DESC";
          break;
      }
    }
    
    let whereClauses = [
      `(${arraybusca.map(() => `nome LIKE ?`).join(' AND ')})`,
      `(${arraybusca.map(() => `descricao LIKE ?`).join(' AND ')})`,
      `(${arraybusca.map(() => `especificacoes LIKE ?`).join(' AND ')})`
    ].join(' OR ');
  
    let query = `SELECT id, nome, categoria, subcategoria, descricao, especificacoes, parcelas, valorparcelas, valortotal, imagem, tamanhos FROM produtos WHERE ${whereClauses} ${ordem}`;
  
    let queryParams = [];
    arraybusca.forEach(term => {
      queryParams.push(`%${term}%`);
    });
    queryParams = [...queryParams, ...queryParams, ...queryParams];
  
    app.mysql.query(query, queryParams, (err, result) => {
      if (err) { 
        return reply.status(403).send({
          success: false,
          message: "Erro na busca!"
        });
      } else {
        return reply.status(200).send({
          success: true,
          produtos: result,
        });
      }
    });
  });

  app.post('/produtoscarrinho', (req, reply) => {
    const { produtos } = req.body;
    const ids = produtos.map(p => p.id)

    app.mysql.query(`SELECT * FROM produtos WHERE id IN (?) LIMIT 60`, [ids], (err, result) => {
      if (err) {
        console.log(err.message);
        return reply.status(500).send({
          success: false,
          message: "Erro na consulta!"
        });
      } else {
        return reply.status(200).send({
          success: true,
          produtos: result
        });
      }
    })
  })
  
}

/*
server.get('/', async (req, reply) => {
  server.mysql.query('SELECT * FROM usuarios', (err, result) => {
    if (err) {
      reply.status(500).send({ success: false, message: 'Database connection failed', error: err.message });
    } else {
      reply.send({ success: true, message: 'Database connection successful', result: result });
      console.log(result)
    }
  });
});
*/

/*
export async function postRoutes(app){
  app.post('/', { onRequest: [isAuth]}, (request, reply) => {
    return reply.status(200).send({
      title: "Hello World",
    })
  })
}
*/
