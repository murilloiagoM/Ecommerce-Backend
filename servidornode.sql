-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/08/2024 às 19:21
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `servidornode`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `subcategorias` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `subcategorias`) VALUES
(1, 'FEMININO', 'Tudo, Camiseta, Calça, Moletom, Calçado'),
(2, 'MASCULINO', 'Tudo, Camiseta, Calça, Moletom, Calçado'),
(3, 'INFANTIL', 'Tudo, Camiseta, Calça, Moletom, Calçado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(240) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `subcategoria` varchar(100) NOT NULL,
  `parcelas` int(11) NOT NULL,
  `valorparcelas` double NOT NULL,
  `valortotal` double NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `especificacoes` varchar(500) NOT NULL,
  `imagem` varchar(300) NOT NULL,
  `tamanhos` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `categoria`, `subcategoria`, `parcelas`, `valorparcelas`, `valortotal`, `descricao`, `especificacoes`, `imagem`, `tamanhos`) VALUES
(1, 'Camiseta Feminina Estampa Floral', 'FEMININO', 'Camiseta', 12, 8.99, 99.99, 'Camiseta feminina com estampa floral, confeccionada em tecido de alta qualidade. \\nPerfeita para compor looks casuais e descontraídos.', '100% algodão, disponível nos tamanhos P, M, G e GG. \\nEstampa digital de alta definição.', '20240715T133827093Z-Camiseta-Feminina-Estampa-Floral.jpg', 'P, M, G, GG'),
(2, 'Camiseta Feminina Básica Branca', 'FEMININO', 'Camiseta', 12, 4.99, 50, 'Camiseta feminina básica na cor branca, ideal para compor diversos tipos de look. \\nConfortável e prática para o dia a dia.', '100% algodão, disponível nos tamanhos PP, P, G e GG. \\nTecido leve e confortável.', '20240715T134841898Z-Camiseta-Feminina-Basica-Branca.jpg', 'PP, P, G, GG'),
(3, 'Camiseta Feminina Listrada', 'FEMININO', 'Camiseta', 12, 6.99, 80, 'Camiseta feminina listrada em preto e branco, estilo casual. \\nCombina com várias peças do guarda-roupa.', '95% algodão, 5% elastano, disponível nos tamanhos P, M, G e EXG. \\nEstilo slim fit.', '20240715T134955160Z-Camiseta-Feminina-Listrada.png', 'P, M, G, EXG'),
(4, 'Camiseta Feminina Estampa Animal Print', 'FEMININO', 'Camiseta', 12, 10, 120, 'Camiseta feminina com estampa animal print, tendência da moda. \\nIdeal para looks ousados e modernos.', '95% poliéster, 5% elastano, disponível nos tamanhos PP, M, G e GG. \\nTecido com toque macio.', '20240715T135105655Z-Camiseta-Feminina-Estampa-Animal-Print.png', 'PP, M, G, GG'),
(5, 'Camiseta Feminina Manga Longa', 'FEMININO', 'Camiseta', 12, 7.99, 90, 'Camiseta feminina manga longa, ideal para dias mais frios. \\nConfortável e estilosa, perfeita para compor diversos looks.', '100% algodão, disponível nos tamanhos P, M, G e GG. \\nTecido leve e confortável.', '20240715T135201584Z-Camiseta-Feminina-Manga-Longa.jpg', 'M, G, GG, EXG'),
(6, 'Calça Jeans Feminina Skinny', 'FEMININO', 'Calça', 12, 15, 180, 'Calça jeans feminina modelo skinny, ideal para qualquer ocasião. \\nConfortável e ajusta-se perfeitamente ao corpo.', '98% algodão, 2% elastano, disponível nos tamanhos 36 a 44. \\nLavagem escura.', '20240715T214733875Z-Calca-Jeans-Feminina-Skinny.jpg', 'P, M, G, EXG'),
(7, 'Calça Feminina Social Preta', 'FEMININO', 'Calça', 12, 16.99, 200, 'Calça feminina social na cor preta, ideal para ambientes de trabalho e ocasiões formais. \\nElegante e confortável.', '100% poliéster, disponível nos tamanhos 36 a 44. \\nCintura alta.', '20240715T214844327Z-Calca-Feminina-Social-Preta.jpg', 'P, GG, EXG'),
(8, 'Calça Feminina de Sarja', 'FEMININO', 'Calça', 12, 8.99, 100, 'Calça feminina de sarja, confortável e versátil. \\nIdeal para compor looks casuais e modernos.', ' 97% algodão, 3% elastano, disponível nos tamanhos 36 a 44. \\nVárias cores disponíveis.', '20240715T214927751Z-Calca-Feminina-de-Sarja.jpg', 'P, PP, M, G, GG, EXG'),
(9, 'Calça Feminina Legging Esportiva', 'FEMININO', 'Calça', 12, 5.99, 69.99, 'Calça legging feminina esportiva, ideal para atividades físicas. \\nConfortável e com ótimo ajuste ao corpo.', '85% poliamida, 15% elastano, disponível nos tamanhos PP, M, GG, EXG. \\nTecnologia de compressão.', '20240715T215047041Z-Calca-Feminina-Legging-Esportiva.jpg', 'PP, P, G, GG'),
(10, 'Calça Feminina Pantalona', 'FEMININO', 'Calça', 12, 10.99, 129.99, 'Calça feminina pantalona, estilo elegante e moderno. \\nIdeal para compor looks sofisticados.', '100% viscose, disponível nos tamanhos 36 a 44. \\nCintura alta.', '20240715T215132906Z-Calca-Feminina-Pantalona.jpg', 'P, M, G, GG, EXG'),
(11, 'Moletom Feminino com Capuz', 'FEMININO', 'Moletom', 12, 14.99, 169.99, 'Moletom feminino com capuz, ideal para dias frios. \\nConfortável e estiloso, perfeito para compor looks casuais.', '80% algodão, 20% poliéster, disponível nos tamanhos M, G e GG. \\nBolso canguru e capuz ajustável.', '20240717T125303778Z-Moletom-Feminino-com-Capuz.jpg', 'M, G, GG'),
(12, 'Moletom Feminino Estampa Frontal', 'FEMININO', 'Moletom', 12, 14.99, 169.99, 'Moletom feminino com estampa frontal, ideal para compor looks descolados. Confortável e quente.', '70% algodão, 30% poliéster, disponível nos tamanhos PP, P, M e G. \\nEstampa de alta definição.', '20240717T125510228Z-Moletom-Feminino-Estampa-Frontal.jpg', 'PP, P, M, G'),
(13, 'Moletom Feminino Liso', 'FEMININO', 'Moletom', 12, 11.99, 139.99, 'Moletom feminino liso, ideal para compor looks básicos e confortáveis. \\nPerfeito para o dia a dia.', '100% algodão, disponível nos tamanhos P, M, G e GG. \\nModelagem clássica.', '20240717T125601372Z-Moletom-Feminino-Liso.jpg', 'P, M, G, GG'),
(14, 'Moletom Feminino Cropped', 'FEMININO', 'Moletom', 12, 10.99, 129.99, 'Moletom feminino cropped, estilo moderno e descolado. \\nIdeal para compor looks fashions.', '95% algodão, 5% elastano, disponível nos tamanhos PP, P, e M. \\nComprimento curto.', '20240717T125716580Z-Moletom-Feminino-Cropped.jpg', 'PP, P, M'),
(15, 'Moletom Feminino Oversized', 'FEMININO', 'Moletom', 12, 18.99, 219, 'Moletom feminino oversized, perfeito para um visual descontraído e confortável. \\nIdeal para combinar com leggings ou jeans.', '85% algodão, 15% poliéster, disponível nos tamanhos M, G, GG e EXG. \\nMangas longas, comprimento alongado e punhos ajustáveis.', '20240717T130609224Z-Moletom-Feminino-Oversized.jpg', 'M, G, GG, EXG'),
(16, 'Sandália Feminina Conforto', 'FEMININO', 'Calçado', 12, 15, 180, 'Sandália feminina projetada para oferecer máximo conforto e elegância. \\nIdeal para o uso diário e ocasiões especiais.', 'Couro sintético; Solado: Borracha antiderrapante; \\nAltura do salto: 5cm; Disponível em diversas cores.', '20240719T162326080Z-Sandalia-Feminina-Conforto.jpg', '34, 35, 36, 37, 38, 40'),
(17, 'Tênis Casual Feminino', 'FEMININO', 'Calçado', 12, 22.99, 269.99, 'Tênis casual feminino, perfeito para o dia a dia e momentos de lazer, com design moderno e confortável.', 'Material: Tecido e couro; Solado: EVA;\\nFechamento: Cadarço;\\nPalmilha: Espuma.', '20240719T162450404Z-Tenis-Casual-Feminino.jpg', '36, 38, 40, 41, 42, 43'),
(18, 'Bota Feminina Inverno', 'FEMININO', 'Calçado', 12, 41.99, 500, 'Bota feminina ideal para o inverno, com forro interno que proporciona aquecimento e conforto.', 'Couro legítimo; Solado: Borracha; Altura do cano: Médio; Forro: Lã sintética.', '20240719T162617890Z-Bota-Feminina-Inverno.jpg', '34, 35, 36, 37, 38, 39, 40'),
(19, 'Sapatilha Feminina Elegante', 'FEMININO', 'Calçado', 12, 34.99, 139.96, 'Sapatilha feminina elegante, ideal para o uso no trabalho e ocasiões formais, combinando conforto e estilo.', 'Material: Tecido; \\nSolado: PVC;\\nPalmilha: Espuma;\\nDetalhes: Laço decorativo.', '20240719T162705206Z-Sapatilha-Feminina-Elegante.jpg', '35, 36, 38, 39, 43, 44'),
(20, 'Chinelo Feminino Verão', 'FEMININO', 'Calçado', 12, 4.99, 49.99, 'Chinelo feminino ideal para os dias quentes de verão, leve e confortável, disponível em diversas cores.', 'Material: Borracha; \\nSolado: Antiderrapante; \\nPalmilha: EVA; \\nFechamento: Sem fecho.', '20240719T162753089Z-Chinelo-Feminino-Verao.jpg', '35, 36, 37, 38, 39, 40, 43, 44'),
(21, 'Camiseta Básica Masculina', 'MASCULINO', 'Camiseta', 12, 8.99, 99.96, 'Camiseta básica masculina, ideal para o uso diário, disponível em diversas cores.', 'Material: Algodão; \\nGola: Redonda; \\nManga: Curta; \\nTamanhos: P, M, G, GG, EXG.', '20240719T162856586Z-Camiseta-Basica-Masculina.jpg', 'P, M, G, GG, EXG'),
(22, 'Camiseta Polo Masculina', 'MASCULINO', 'Camiseta', 12, 16.99, 199.99, 'Camiseta polo masculina, ideal para eventos casuais e formais, com design elegante e confortável.', 'Algodão Piquet; \\nGola: Polo; \\nManga: Curta; \\nDetalhes: Bordado no peito.', '20240719T162949601Z-Camiseta-Polo-Masculina.jpg', 'P, M, G'),
(23, 'Camiseta Estampa Masculina', 'MASCULINO', 'Camiseta', 12, 7.99, 89.97, 'Camiseta masculina com estampas modernas e variadas, ideal para compor looks despojados.', 'Material: Poliéster; \\nGola: Redonda; \\nManga: Curta; \\nEstampa: Sublimação.', '20240719T163027158Z-Camiseta-Estampada-Masculina.jpg', 'G, GG, EXG'),
(24, 'Camiseta Regata Masculina', 'MASCULINO', 'Camiseta', 12, 3.99, 39.98, 'Camiseta regata masculina, ideal para a prática de esportes e dias quentes, com tecido leve e confortável.', 'Material: Poliéster; \\nGola: Redonda; \\nManga: Sem manga; \\nTamanhos: P, G, GG.', '20240719T163108975Z-Camiseta-Regata-Masculina.jpg', 'P, G, GG'),
(25, 'Camiseta Longline Masculina', 'MASCULINO', 'Camiseta', 12, 11.99, 139.96, 'Camiseta longline masculina, ideal para compor looks modernos e estilosos, com comprimento alongado.', 'Material: Algodão; \\nGola: Redonda; \\nManga: Curta; \\nCorte: Longline.', '20240719T163148483Z-Camiseta-Longline-Masculina.jpg', 'PP, M, G'),
(26, 'Calça Jeans Masculina', 'MASCULINO', 'Calça', 12, 24.99, 299.95, 'Calça jeans masculina com corte reto, ideal para o uso diário e combinações diversas.', 'Material: Jeans; \\nFechamento: Zíper e botão; \\nBolsos: 5 bolsos; \\nLavagem: Média.', '20240719T163235976Z-Calca-Jeans-Masculina.jpg', 'PP, M, GG, EXG'),
(27, 'Calça Social Masculina', 'MASCULINO', 'Calça', 12, 24.99, 289.99, 'Calça social masculina, ideal para eventos formais e ambientes de trabalho, com design elegante.', 'Material: Poliéster e viscose;\\nFechamento: Zíper e botão; \\nCorte: Reto; \\nBolsos: Frontais e traseiros.', '20240719T163320474Z-Calca-Social-Masculina.jpg', 'PP, P, M, G, GG, EXG'),
(28, 'Calça Moletom Masculina', 'MASCULINO', 'Calça', 12, 9.99, 119.96, 'Calça de moletom masculina, ideal para o uso casual e momentos de lazer, com tecido macio e confortável.', 'Material: Moletom; \\nFechamento: Cadarço; \\nBolsos: Laterais; \\nCós: Elástico.', '20240719T163401379Z-calca-moletom-cargo-azul-jeans-.jpg', 'P, M, G, EXG'),
(29, 'Calça Cargo Masculina', 'MASCULINO', 'Calça', 12, 16.99, 199.99, 'Calça cargo masculina, ideal para o uso em atividades ao ar livre, com bolsos utilitários.', 'Material: Sarja; \\nFechamento: Zíper e botão; \\nBolsos: Vários bolsos; \\nCorte: Reto.', '20240719T163437221Z-Calca-Cargo-Masculina.jpg', 'M, G, GG, EXG'),
(30, 'Calça Jogger Masculina', 'MASCULINO', 'Calça', 12, 11.99, 139.99, 'Calça jogger masculina, ideal para looks despojados e modernos, com barra ajustada.', 'Material: Algodão; \\nFechamento: Cadarço; \\nBolsos: Laterais e traseiros; \\nCós: Elástico.', '20240719T163508291Z-Calca-Jogger-Masculina.png', 'P, G, GG'),
(31, 'Moletom com Capuz Masculino', 'MASCULINO', 'Moletom', 12, 20.99, 249.95, 'Moletom com capuz masculino, ideal para os dias frios, com design casual e confortável.', 'Material: Moletom; \\nFechamento: Zíper; \\nBolsos: Frontais; \\nCapuz: Ajustável com cordão.', '20240719T163551302Z-Moletom-com-Capuz-Masculino.jpg', 'PP, P, M, EXG'),
(32, 'Moletom Canguru Masculino', 'MASCULINO', 'Moletom', 12, 13.99, 159.96, 'Moletom canguru masculino, ideal para o uso diário, com bolso frontal e capuz.', 'Algodão e poliéster; \\nFechamento: Sem zíper; \\nBolsos: Bolso canguru; \\nCapuz: Ajustável com cordão.', '20240719T163636797Z-Moletom-Canguru-Masculino.jpg', 'P, M, G, EXG'),
(33, 'Moletom Slim Fit Masculino', 'MASCULINO', 'Moletom', 12, 29.99, 349.99, 'Moletom slim fit masculino, ideal para compor looks modernos e elegantes, com ajuste ao corpo.', 'Material: Algodão; \\nFechamento: Zíper; \\nBolsos: Laterais; \\nCapuz: Fixo.', '20240719T163712092Z-Moletom-Slim-Fit-Masculino.jpg', 'P, M, G, EXG'),
(34, 'Moletom Oversized Masculino', 'MASCULINO', 'Moletom', 12, 20.99, 249.99, 'Moletom oversized masculino, ideal para looks despojados, com caimento solto e confortável.', 'Material: Algodão; \\nFechamento: Sem zíper; \\nBolsos: Sem bolsos; \\nCapuz: Ajustável com cordão.', '20240719T163747306Z-Moletom-Oversized-Masculino.jpg', 'M, GG, EXG'),
(35, 'Moletom estampa Masculino', 'MASCULINO', 'Moletom', 12, 12.99, 139.99, 'Moletom estampado masculino, ideal para looks despojados e estilosos, com diversas estampas modernas.', 'Material: Algodão e poliéster;\\nFechamento: Sem zíper; \\nBolsos: Frontais; \\nCapuz: Fixo.', '20240719T163817701Z-Moletom-Estampado-Masculino.jpg', 'G, GG, EXG'),
(36, 'Sapatênis Masculino Casual', 'MASCULINO', 'Calçado', 12, 16.99, 199.99, 'Sapatênis masculino casual, ideal para o uso diário e eventos casuais, com design elegante.', 'Material: Couro sintético; \\nSolado: Borracha; \\nFechamento: Cadarço; \\nPalmilha: Confortável.', '20240719T164006412Z-Sapatenis-Masculino-Casual.jpg', '35, 36, 37, 38, 39, 40, 42, 43'),
(37, 'Tênis Esportivo Masculino', 'MASCULINO', 'Calçado', 12, 24.99, 299.95, 'Tênis esportivo masculino, ideal para a prática de esportes, com design ergonômico e leve.', 'Material: Tecido e sintético; \\nSolado: EVA; \\nFechamento: Cadarço; \\nPalmilha: Anatômica.', '20240719T163915805Z-Tenis-Esportivo-Masculino.jpg', '35, 36, 38, 39, 40, 41, 43'),
(38, 'Bota Masculina Aventura', 'MASCULINO', 'Calçado', 12, 33.99, 399.99, 'Bota masculina ideal para aventuras e trilhas, com design robusto e resistente.', 'Material: Couro; \\nSolado: Borracha tratorada; \\nFechamento: Cadarço; \\nForro: Tecido respirável.', '20240719T164051207Z-Bota-Masculina-Aventura.jpg', '34, 36, 37, 38, 39, 40, 41, 42, 44'),
(39, 'Sandália Masculina Conforto', 'MASCULINO', 'Calçado', 12, 7.99, 89.99, 'Sandália masculina ideal para os dias quentes, com design confortável e resistente.', 'Material: Couro sintético; \\nSolado: Borracha; \\nFechamento: Velcro; \\nPalmilha: Anatômica.', '20240719T164126422Z-Sandalia-Masculina-Conforto.jpg', '35, 36, 37, 38, 39'),
(40, 'Mocassim Masculino Elegante', 'MASCULINO', 'Calçado', 12, 20.99, 249.99, 'Mocassim masculino elegante, ideal para eventos formais e informais, com design clássico e confortável.', 'Material: Couro legítimo; \\nSolado: Borracha; \\nFechamento: Sem fecho; \\nPalmilha: Confortável.', '20240719T164229847Z-Mocassim-Masculino-Elegante.jpg', '34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44'),
(41, 'Camiseta Infantil Estampada', 'INFANTIL', 'Camiseta', 12, 4.99, 59.99, 'Camiseta infantil com estampas divertidas e coloridas, ideal para o uso diário e combinações variadas.', 'Algodão; \\nGola: Redonda; \\nManga: Curta; \\nEstampas: Variedades de desenhos infantis.', '20240719T165348895Z-Camiseta-Infantil-Estampada.jpg', 'PP, P, G, EXG'),
(42, 'Camiseta Infantil Básica', 'INFANTIL', 'Camiseta', 12, 2.99, 29.99, 'Camiseta básica infantil, disponível em diversas cores, ideal para o dia a dia e atividades escolares.', 'Material: Algodão; \\nGola: Redonda; \\nManga: Curta; \\nCores: Variedade de cores sólidas.', '20240719T165424594Z-Camiseta-Infantil-Basica.jpg', 'PP, M, G, GG'),
(43, 'Camiseta Infantil de Super-Heróis', 'INFANTIL', 'Camiseta', 12, 8.99, 99.96, 'Camiseta infantil com estampas de super-heróis, perfeita para os pequenos fãs, com material confortável.', 'Material: Algodão e poliéster; \\nGola: Redonda; \\nManga: Curta; \\nEstampas: Super-heróis variados.', '20240719T165458142Z-Camiseta-Infantil-de-Super-Herois.jpg', 'PP, P, GG, EXG'),
(44, 'Camiseta Infantil Longa', 'INFANTIL', 'Camiseta', 12, 7.99, 89.99, 'Camiseta infantil de manga longa, ideal para dias mais frescos, com design confortável e estiloso.', 'Material: Algodão; \\nGola: Redonda; \\nManga: Longa; \\nEstampas: Variedade de estampas divertidas.', '20240719T165530743Z-Camiseta-Infantil-Longa.jpg', 'PP, M, GG, EXG'),
(45, 'Camiseta Infantil Esportiva', 'INFANTIL', 'Camiseta', 12, 6.99, 79.99, 'Camiseta infantil esportiva, ideal para práticas de esportes e atividades físicas, com tecido respirável.', 'Material: Poliéster; \\nGola: Redonda; \\nManga: Curta; \\nDetalhes: Recortes em tecido mesh para ventilação.', '20240719T165604271Z-Camiseta-Infantil-Esportiva.jpg', 'P, G, GG'),
(46, 'Calça Jeans Infantil', 'INFANTIL', 'Calça', 12, 9.99, 119.99, 'Calça jeans infantil, ideal para o uso diário, resistente e confortável, com diversos tamanhos disponíveis.', 'Material: Jeans; \\nFechamento: Zíper e botão; \\nBolsos: Frontais e traseiros; \\nDetalhes: Lavagem moderna.', '20240719T165641214Z-Calca-Jeans-Infantil.jpg', 'P, M, G, GG, EXG'),
(47, 'Calça Moletom Infantil', 'INFANTIL', 'Calça', 12, 6.99, 74.99, 'Calça de moletom infantil, ideal para o uso em casa e atividades ao ar livre, com tecido macio e confortável.', 'Material: Algodao; \\nFechamento: Cadarço; \\nBolsos: Laterais; \\nCós: Elástico.', '20240719T165726717Z-Calca-Moletom-Infantil.jpg', 'P, G, GG, EXG'),
(48, 'Calça Legging Infantil', 'INFANTIL', 'Calça', 12, 3.99, 39.98, 'Calça legging infantil, ideal para a prática de esportes e atividades físicas, com tecido elástico e confortável.', 'Material: Poliéster e elastano; \\nFechamento: Sem fecho; \\nBolsos: Sem bolsos; \\nCós: Elástico.', '20240719T165806020Z-Calca-Legging-Infantil.jpg', 'PP, M, G, GG'),
(49, 'Calça Sarja Infantil', 'INFANTIL', 'Calça', 12, 8.99, 99.96, 'Calça sarja infantil, ideal para eventos casuais e formais, com design elegante e confortável.', 'Material: Sarja; \\nFechamento: Zíper e botão; \\nBolsos: Frontais e traseiros; \\nCós: Ajustável.', '20240719T165844612Z-Calca-Sarja-Infantil.jpg', 'PP, GG, EXG'),
(50, 'Calça Tactel Infantil', 'INFANTIL', 'Calça', 12, 4.99, 59.99, 'Calça tactel infantil, ideal para atividades ao ar livre, com tecido leve e de secagem rápida.', 'Material: Tactel; \\nFechamento: Elástico; \\nBolsos: Laterais e traseiros; \\nCós: Ajustável com cordão.', '20240719T165911714Z-Calca-Tactel-Infantil.jpg', 'P, M, G, EXG'),
(51, 'Moletom Infantil com Capuz', 'INFANTIL', 'Moletom', 12, 8.99, 99.99, 'Moletom infantil com capuz, ideal para os dias frios, com design confortável e estiloso.', 'Material: Moletom; \\nFechamento: Zíper; \\nBolsos: Frontais; \\nCapuz: Ajustável com cordão.', '20240719T165947077Z-Moletom-Infantil-com-Capuz.jpg', 'P, M, G, EXG'),
(52, 'Moletom Canguru Infantil', 'INFANTIL', 'Moletom', 12, 4.99, 59.97, 'Moletom canguru infantil, ideal para o uso diário, com bolso frontal e capuz ajustável.', 'Material: Algodão e poliéster;\\nFechamento: Sem zíper; \\nBolsos: Bolso canguru; \\nCapuz: Ajustável com cordão.', '20240719T170024055Z-Moletom-Canguru-Infantil.jpg', 'P, M, GG, EXG'),
(53, 'Moletom Infantil Slim Fit', 'INFANTIL', 'Moletom', 12, 8.99, 99.99, 'Moletom infantil slim fit, ideal para compor looks modernos e elegantes, com ajuste ao corpo.', 'Material: Algodão; \\nFechamento: Zíper; \\nBolsos: Laterais; \\nCapuz: Fixo.', '20240719T170053304Z-Moletom-Infantil-Slim-Fit.jpg', 'P, M, G'),
(54, 'Moletom Infantil Oversized', 'INFANTIL', 'Moletom', 12, 8.99, 99.99, 'Moletom infantil oversized, ideal para looks despojados, com caimento solto e confortável.', 'Material: Algodão; \\nFechamento: Sem zíper; \\nBolsos: Sem bolsos; \\nCapuz: Ajustável com cordão.', '20240719T170128005Z-Moletom-Infantil-Oversized.jpg', 'M, G, GG, EXG'),
(55, 'Moletom Infantil Estampado', 'INFANTIL', 'Moletom', 12, 8.99, 99.99, 'Moletom infantil com estampas divertidas e coloridas, ideal para os dias frios e combinações despojadas.', 'Material: Algodão e poliéster;\\nFechamento: Zíper; \\nBolsos: Frontais; \\nCapuz: Ajustável com cordão; \\nEstampas: Variedade de desenhos infantis.', '20240719T170205087Z-Moletom-Infantil-Estampado.jpg', 'G, GG, EXG'),
(56, 'Tênis Infantil Casual', 'INFANTIL', 'Calçado', 12, 9.99, 119.96, 'Tênis infantil casual, ideal para o uso diário e atividades ao ar livre, com design confortável e moderno.', 'Material: Tecido e sintético; \\nSolado: Borracha; \\nFechamento: Cadarço; \\nPalmilha: Anatômica.', '20240719T170249064Z-Tenis-Infantil-Casual.jpg', '33, 34, 35, 37, 38'),
(57, 'Sandália Infantil Conforto', 'INFANTIL', 'Calçado', 12, 4.99, 59.97, 'Sandália infantil ideal para os dias quentes, com design confortável e resistente, fácil de calçar.', 'Material: Couro sintético; \\nSolado: Borracha; \\nFechamento: Velcro; \\nPalmilha: Anatômica.', '20240719T170325753Z-Sandalia-Infantil-Conforto.jpg', '33, 34, 35, 36, 37, 38'),
(58, 'Bota Infantil Aventura', 'INFANTIL', 'Calçado', 12, 16.99, 199.99, 'Bota infantil ideal para aventuras e trilhas, com design robusto e resistente, proporcionando segurança.', 'Material: Couro; \\nSolado: Borracha tratorada; \\nFechamento: Cadarço; \\nForro: Tecido respirável.', '20240719T170407774Z-Bota-Infantil-Aventura.jpg', '33, 34, 35, 37'),
(59, 'Sapatênis Infantil Elegante', 'INFANTIL', 'Calçado', 12, 8.99, 99.99, 'Sapatênis infantil elegante, ideal para eventos casuais e formais, com design clássico e confortável.', 'Material: Couro sintético; \\nSolado: Borracha; \\nFechamento: Cadarço; \\nPalmilha: Confortável.', '20240719T170436883Z-Sapatenis-Infantil-Elegante.jpg', '33, 35, 36, 39, 41'),
(60, 'Tênis Infantil Esportivo', 'INFANTIL', 'Calçado', 12, 12.99, 149.99, 'Tênis infantil esportivo, ideal para a prática de esportes e atividades físicas, com design ergonômico.', 'Material: Tecido e sintético; \\nSolado: EVA; \\nFechamento: Cadarço; \\nPalmilha: Anatômica.', '20240719T170511507Z-Tenis-Infantil-Esportivo.jpg', '33, 34, 35, 36, 37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(70) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `email`, `nome`, `senha`) VALUES
(1, 'adminacc@email.com', 'adminacc', '8b5e28f4769e96d8ed2d0b4c9e147ad77dc35a751432d3e445301aace35da325'),
(2, 'teste0@email.com', 'teste0', 'c2a3e881aafb12b6dc3a2ea4b39b61e1ab97e552e9e82eea1d89ef7f8dfcd20b'),
(3, 'teste1@email.com', 'teste1', '257a0eec39806eabc965582dad9b5bacee9c02d3f7bb4046b34433accac579a3'),
(4, 'teste5@email.com', 'Teste 5', 'ed5028b5203f4e61ad26203e49febb3ee670e3da48333c6ca3a1a00aa7371e18');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
