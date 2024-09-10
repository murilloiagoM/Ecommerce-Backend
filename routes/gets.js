import fs from 'fs';
import path from 'path';
import { promisify } from 'util';

const readFile = promisify(fs.readFile);

export async function getsRoutes(app){

  const serveStatic = async (request, reply) => {
    const filePath = path.resolve('uploads', request.raw.url.replace('/uploads/', ''));
    
    try {
      if (!fs.existsSync(filePath)) {
        reply.code(404).send('File not found');
        return;
      }
      const data = await readFile(filePath);
  
      let contentType = 'application/octet-stream';
      if (filePath.endsWith('.jpg') || filePath.endsWith('.jpeg')) {
        contentType = 'image/jpeg';
      } else if (filePath.endsWith('.png')) {
        contentType = 'image/png';
      } else if (filePath.endsWith('.gif')) {
        contentType = 'image/gif';
      }
      reply
        .header('Content-Type', contentType)
        .send(data);
    } catch (error) {
      reply.code(404).send('File not found');
    }
  };

  app.get('/uploads/*', serveStatic);

  app.get('/categorias', (req, reply) => {
    app.mysql.query('SELECT * FROM categorias', [], (err, result) => {
      if (err) {
        console.log(err.message)
        return reply.status(403).send({
          sucess: false,
          message: "Erro nas categorias!"
        })
      } else {
        return reply.status(200).send({
          sucess: true,
          categorias: result
        })
      }
    });
  })

  app.get('/produtos/:offset', (req, reply) => {
    const offsetParam = req.params.offset;
    
    const offset = offsetParam === "0" ? 0 : Number(offsetParam) * 25;
    let countResult = ""
    app.mysql.query('SELECT COUNT(*) FROM produtos', [], (err, result) => {
      if (err) {
        console.log(err.message);
        return reply.status(403).send({
          success: false,
          message: "Erro ao verificar tamanho!"
        });
      } else {
        countResult = result
        app.mysql.query('SELECT id, nome, categoria, subcategoria, descricao, especificacoes, parcelas, valorparcelas, valortotal, imagem, tamanhos FROM produtos LIMIT 25 OFFSET ?', [offset], (err, result) => {
          if (err) {
            console.log(err.message);
            return reply.status(403).send({
              success: false,
              message: "Erro nos produtos!"
            });
          } else {
            let quantidade = countResult[0]['COUNT(*)']
            let existemais = false  
            if(((offset + 25) < quantidade) ){
              existemais = true
            }else{
              existemais = false
            }
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

  app.get('/produtoid/:id', (req, reply) => {
    const id = req.params.id;
    
    app.mysql.query('SELECT * FROM produtos WHERE id = ?', [id], (err, result) => {
      if (err) {
        console.log(err.message);
        return reply.status(403).send({
          success: false,
          message: "Erro no produto!"
        });
      } else {
        if(result.length > 0){
          return reply.status(200).send({
            success: true,
            produto: result,
          });
        }else{
          return reply.status(403).send({
            success: false,
            message: 'Produto nao existe!'
          });
        }
        
      }
    });

  });
  

  /*app.get('/getcookie', (request, reply) => {
    const cookies = request.cookies; // acessa todos os cookies
    reply.send({ cookies });
  });*/
}
