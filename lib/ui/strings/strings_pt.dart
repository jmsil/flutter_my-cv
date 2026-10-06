import 'strings.dart';

class StringsPt extends Strings {
  @override
  String get appName => 'Bem-vindo(a) ao Meu Currículo Online';
  @override
  String get longRoles =>
    'Desenvolvedor Flutter\n'
    'Desenvolvedor SAP Integration Suite';
  @override
  String get professionalSummaryTitle => 'Resumo Profissional';
  @override
  String get professionalSummaryInfo => 'Desenvolvedor de software sênior com mais de 15 anos de experiência em aplicações comerciais cliente-servidor (ERP), aplicativos móveis Android, design e desenvolvimento de jogos casuais, e aplicações multiplataforma com o framework Flutter.';
  @override
  String get detailsTitle => 'Detalhes';
  @override
  String get personalLocation => 'GO, Brasil';
  @override
  String get programmingSkillsTitle => 'Habilidades em Programação';
  @override
  String get integrationSkillsTitle => 'Habilidades em Integração';
  @override
  String get aboutAndExpectationsTitle => 'Sobre Mim e Expectativas';
  @override
  String get aboutAndExpectationsInfo =>
    'Apaixonado por ilustração digital para jogos e pela arte da música.\n\n'

    'Sou um eterno aprendiz, sempre motivado a dominar novos assuntos. Quando o tema é desenvolvimento de software, priorizo fontes de alta qualidade, como livros técnicos, documentações oficiais e artigos especializados.\n\n'

    'Busco sempre a excelência em tudo o que faço, mantendo um forte compromisso com a qualidade do produto final. Valorizo muito a legibilidade do código e a performance — e foi por isso que escolhi o Flutter como meu framework multiplataforma.\n\n'

    'Busco oportunidades para colaborar em projetos de desenvolvimento de aplicativos e integração de sistemas, onde eu possa aplicar minhas habilidades técnicas, gerar valor para o negócio, e continuar evoluindo profissionalmente dentro da organização.';
  @override
  String get madeWithFlutter => 'Feito com Flutter  🩵';
  @override
  String get language => 'Idioma';
  @override
  String get experienceTitle => 'Experiência';
  @override
  String get sapIntegrationSuiteLearningJourneyTitle => 'Jornada de Estudos SAP Integration Suite';
  @override
  String get sapIntegrationSuiteLearningJourneyDetail => '2023 - Março/2025 - Julho/2026';
  @override
  String get sapIntegrationSuiteLearningJourneyInfo =>
    'Completei a jornada de aprendizado Developing with SAP Integration Suite, focando nos fundamentos de integrações empresariais e exercícios práticos para a certificação SAP Integration Suite.\n\n'

    'O portfólio resultante implementa as principais técnicas de integração abaixo:\n'
    '▪ Orquestração avançada de segurança validando JWT Google Firebase via API Management.\n'
    '▪ Orquestração avançada de segurança com OAuth2, JWT assinado e autenticação mTLS.\n'
    '▪ Scripts avançados para roteamento de iFlows, tratamento de exceções, e leitura de artefatos de segurança.\n'
    '▪ Mapeamento avançado de dados com manipulação de contexto, filas, e node functions.\n'
    '▪ Integração com o serviço Google Firebase Authentication para gerenciamento de usuários.\n'
    '▪ Comunicação assíncrona via JMS Queues.\n'
    '▪ Conversões XSLT, XML e JSON e mapeamento de namespaces.\n'
    '▪ Consumo dinâmico de serviço SOAP via parâmetros de requisição e mapeamentos.\n'
    '▪ Conexão com banco de dados SQL Server.';
  @override
  String get sapIntegrationSuiteLearningJourneyPortfolioTitle => 'Portfólio SAP Integration Suite';
  @override
  String get integrationProjectApimProxyDescription => 'Permite que aplicações do usuário final se conectem ao Cloud Integration com um token JWT do Firebase.';
  @override
  String get integrationProjectApimProxyInfo =>
    '${Strings.widgetPlaceholder}'

    'Aplicações do usuário final devem se autenticar em sistemas backend com credenciais que permitem o sistema backend confiar e identificar o usuário da requisição.\n\n'

    'Este API Management Proxy aplica as seguintes políticas para confiar e identificar um usuário final autenticado via Google Cloud Firebase Authentication:'

    '${Strings.title('▪ ForbidResources', false)}'
    'Esta política RaiseFault proíbe o acesso a recursos administrativos. Neste cenário, as operações Google Firebase Auth Users não podem ser chamadas por uma aplicação do usuário final.'

    '${Strings.title('▪ GetFirebaseJwtClaims')}'
    'Esta política KeyValueMapOperations lê as claims issuer e audience configuradas para a aplicação do Firebase.'

    '${Strings.title('▪ LookupGoogleApisJwksCache')}'
    'Esta política LookupCache lê as chaves públicas das APIs Google anteriormente baixadas e armazenadas em cache.'

    '${Strings.title('▪ FetchGoogleApisJwks')}'
    'Esta política ServiceCallout baixa as chaves públicas das APIs Google se não houver um cache válido.'

    '${Strings.title('▪ ExtractGoogleApisJwksMaxAge')}'
    'Esta política ExtractVariables extrai o valor max-age do cabeçalho Cache-Control da resposta da política anterior. Este valor é usado para determinar o prazo de expiração do cache das chaves públicas das APIs Google.'

    '${Strings.title('▪ PopulateGoogleApisJwksCache')}'
    'Esta política PopulateCache salva em cache as chaves públicas das APIs Google baixadas.'

    '${Strings.title('▪ VerifyFirebaseJwt')}'
    'Esta política VerifyJWT verifica o token JWT do Firebase da requisição da aplicação do usuário final. Ela valida as claims e a assinatura com as chaves públicas das APIs Google.'

    '${Strings.title('▪ SetHeaders')}'
    'Esta política AssignMessage adiciona o cabeçalho User-ID com o ID do usuário final extraído do token JWT do Firebase e remove o cabeçalho Authorization antes de encaminhar a requisição para o Cloud Integration.'

    'Os recursos estão documentados no API Management seguindo a especificação OpenAPI:'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectIFlowProxyDescription => 'Valida requisições e gerencia o roteamento para os iFlows.';
  @override
  String get integrationProjectIFlowProxyInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow é o ponto de entrada para todos os iFlows do projeto. Ele executa as seguintes operações:\n'
    '▪ Validação de configurações de requisições.\n'
    '▪ Roteamento de iFlow via ProcessDirect baseado no caminho da requisição.\n'
    '▪ Logs de exceções.\n'
    '▪ Limpeza de cabeçalhos sensíveis.'

    '${Strings.title('Validação de Configurações de Requisições')}'
    'Para cada rota, as seguintes configurações são validadas:\n'
    '▪ Métodos HTTP suportados.\n'
    '▪ Caminhos suportados.\n'
    '▪ Parâmetros de consulta suportados.'

    '${Strings.widgetPlaceholder}'

    'Requisições que não correspondem às configurações de rotas retornam 404 (Not Found).\n'
    'Métodos HTTP não suportados retornam 405 (Method Not Allowed).\n'
    'Parâmetros de consulta incorretos retornam 400 (Bad Request).'

    '${Strings.title('Limpeza de Cabeçalhos Sensíveis')}'
    'Alguns cabeçalhos sensíveis gerados durante o processamento dos iFlows, como Authorization, cabeçalhos customizados usando o padrão de nomenclatura _*, cabeçalhos auto-gerados por etapas DataStore, e outros, são removidos antes de retornar para o Sender.'

    '${Strings.title('Tratamento de Exceções')}'
    'O tratamento de exceções consiste em rotear exceções para o iFlow Exception Handler.\n\n'

    'O script a seguir trata exceções de iFlows não publicados, exceções do proxy, e exceções de iFlows internos:'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectExceptionHandlerDescription => 'Salva dados da mensagem no Message Processing Log e envia emails de alerta.';
  @override
  String get integrationProjectExceptionHandlerInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow é responsável por manipular as exceções de todo o projeto.\n\n'

    'Logs, emails de alerta, e configurações SMTP podem ser configurados via parâmetros externalizados.\n\n'

    'O script a seguir, executado por cada iFlow, trata todas as exceções mapeadas. Exceções não tratadas são propagadas até o iFlow Proxy, onde este iFlow as captura:'
    '${Strings.widgetPlaceholder}'

    'Exceções comuns relacionadas a formatos de payload incorretos, erros de validação de esquemas, e conflitos de banco de dados são tratadas como má requisição do usuário.\n'
    'Exceções HTTP e SOAP são tratadas ou propagadas dependendo do código de retorno.';
  @override
  String get integrationProjectOAuth2TokensHandlerDescription => 'Gera, armazena em cache, e gerencia o prazo de expiração de tokens OAuth2.';
  @override
  String get integrationProjectOAuth2TokensHandlerInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow gerencia o ciclo de vida de tokens OAuth2 para os seguintes cenários:\n'
    '▪ Servidores OAuth2 que requerem autenticação Client Credentials e mTLS para geração de tokens.\n'
    '▪ Servidores Google APIs OAuth2 que requerem um JWT assinado como autenticação para geração de tokens.'

    '${Strings.title('Client Credentials e mTLS')}'
    'Durante o desenvolvimento desta solução, o adaptador HTTP Receiver não permitia a configuração dos métodos de autenticação OAuth2 Client Credentials e Client Certificate simultaneamente\n'
    'A mesma limitação se aplica à função built-in do SDK oficial para gerenciamento de ciclo de vida de tokens OAuth2.\n'
    'Esta solução gera um corpo de requisição a partir de um artefato OAuth2 Client Credentials publicado e configura o adaptador HTTP Receiver com o método de autenticação Client Certificate.'

    '${Strings.title('Google APIs OAuth2 com JWT Assinado')}'
    'Esta solução gera um corpo de requisição com o JWT assinado usando uma Google APIs Service Key publicada contendo a chave privada.\n\n'

    'Os scripts a seguir são o centro da solução. Eles implementam o tratamento dos tokens e dos artefatos de segurança:'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectGoogleFirebaseAuthUsersDescription => 'Gerencia usuários finais no serviço Google Firebase Authentication.';
  @override
  String get integrationProjectGoogleFirebaseAuthUsersInfo =>
    'Esta solução tem o objetivo de replicar usuários do sistema SAP (e.g., Business Partners) para o serviço Google Firebase Authentication de modo que eles possam se autenticar em aplicações do usuário final que implementam a solução Firebase Authentication.\n\n'

    'Ela é composta pelos seguintes iFlows:'

    '${Strings.title('▪ Google Firebase Auth Users', false)}'
    '${Strings.widgetPlaceholder}'

    'Este é o iFlow principal, o qual executa a real integração. Ele suporta as seguintes operações:\n'
    '▪ POST / - cria um novo usuário informando seu ID e email.\n'
    '▪ PATCH / - atualiza um usuário informando seu ID, email, e status (habilitado/desabilitado).\n'
    '▪ DELETE /{userId} - exclui um usuário informando seu ID.'

    '${Strings.title('▪ Google Firebase Auth Users Async')}'
    '${Strings.widgetPlaceholder}'

    'Este iFlow processa o iFlow principal de forma assíncrona armazenando a requisição em uma fila JMS e retornando imediatamente para o Sender.\n'
    'A real integração é processada mais tarde por outro iFlow.'

    '${Strings.title('▪ Google Firebase Auth Users Async Queue')}'
    '${Strings.widgetPlaceholder}'

    'Este iFlow processa a fila JMS de requisições assíncronas, chama o iFlow principal, e armazena a resposta para futuro consumo.'

    '${Strings.title('▪ Google Firebase Auth Users Async Response')}'
    '${Strings.widgetPlaceholder}'

    'Este iFlow retorna todas as respostas armazenadas pendentes e as remove do armazenamento.';
  @override
  String get integrationProjectInterStatementOauth2MtlsDescription => 'Consulta extrato bancário por período da minha conta empresarial do Banco Inter.';
  @override
  String get integrationProjectInterStatementOauth2MtlsInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow implementa uma integração de API que requer autorização OAuth2 e Mutual TLS handshake.\n\n'

    'O iFlow OAuth2 Tokens Handler configura o cabeçalho Authorization.\n\n'

    'O handshake mTLS é configurado no adaptador HTTP Receiver com o método de autenticação Client Certificate.\n\n'

    'A requisição tem o seguinte formato:\n'
    'GET /?start-date={T_DATE}&end-date={T_DATE}.';
  @override
  String get integrationProjectSqlServerWithXsltDescription => 'Conecta a um banco de dados SQL Server via JDBC e executa operações básicas.';
  @override
  String get integrationProjectSqlServerWithXsltInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow utiliza XSLT para transformar uma requisição no formato JSON para o formato XML requerido pelo adaptador JDBC.\n\n'

    'As operações suportadas são:\n'
    '▪ POST /search - Operação SELECT.\n'
    '▪ POST / - Operação INSERT.\n'
    '▪ PATCH / - Operação UPDATE.\n\n'

    'O esquema de validação XML e o mapeamento XSLT são configurados pelos cabeçalhos CamelHttpMethod e CamelHttpPath:'
    '${Strings.widgetPlaceholder}\n'

    'O exemplo a seguir demonstra a implementação da operação SELECT:'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectConversionsAndFtpDescription => 'Converte o payload de/para diferentes formatos e salva o resultado em um servidor FTP.';
  @override
  String get integrationProjectConversionsAndFtpInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow implementa as conversões mais comuns.\n'
    'O cabeçalho Content-Type define o formato de origem.\n'
    'O cabeçalho Accept define o formato de destino.\n\n'

    'As conversões suportadas são:\n'
    '▪ POST / - text/csv > application/xml.\n'
    '▪ POST / - application/json > application/xml.\n'
    '▪ POST / - application/xml > text/csv.\n'
    '▪ POST / - application/xml > application/json.\n\n'

    'O resultado é salvo em um servidor FTP configurado via parâmetros externalizados.\n\n'

    'Para efeito de demonstração, as conversões entre os formatos XML e JSON incluem mapeamento de namespaces:'

    '${Strings.title('▪ JSON para XML', false)}'
    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}'

    '${Strings.title('▪ XML para JSON')}'
    '${Strings.widgetPlaceholder}'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectMappingsDescription => 'Mapeia árvores de dados hierárquicas e planas.';
  @override
  String get integrationProjectMappingsInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow aplica manipulação de contexto e funções para mapear os seguintes cenários:'

    '${Strings.title('▪ Árvore hierárquica para árvore plana:', false)}'
    '${Strings.widgetPlaceholder}\n'

    'O exemplo a seguir demonstra o payload e o resultado do mapeamento (não ordenado):'
    '${Strings.widgetPlaceholder}'

    '${Strings.title('▪ Árvore plana para árvore hierárquica:')}'
    '${Strings.widgetPlaceholder}\n'

    'O exemplo a seguir demonstra o payload e o resultado do mapeamento (ordenado):'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectCalculatorDescription => 'Consome o webservice público Calculator (http://www.dneonline.com/calculator.asmx).';
  @override
  String get integrationProjectCalculatorInfo =>
    '${Strings.widgetPlaceholder}'

    'Este iFlow implementa dinamicamente as quatro operações disponíveis no webservice SOAP público Calculator.\n\n'

    'As quatro operações suportadas são:\n'
    '▪ GET /?operation=Add&paramA={T_INT}&paramB={T_INT}.\n'
    '▪ GET /?operation=Subtract&paramA={T_INT}&paramB={T_INT}.\n'
    '▪ GET /?operation=Multiply&paramA={T_INT}&paramB={T_INT}.\n'
    '▪ GET /?operation=Divide&paramA={T_INT}&paramB={T_INT}.\n\n'

    'O parâmetro operation configura o cabeçalho SoapAction e os mapeamentos:'
    '${Strings.widgetPlaceholder}\n'

    'Os parâmetros paramA e paramB são mapeados para os parâmetros da requisição SOAP:'
    '${Strings.widgetPlaceholder}';
  @override
  String get integrationProjectsScriptCollectionInfo => '*Você pode encontrar a coleção de scripts deste projeto no meu GitHub.';
  @override
  String get fortlevExperienceTitle => 'Desenvolvimento de Aplicativo Flutter Mobile';
  @override
  String get fortlevExperienceDetail => 'BCI/Fortlev ▪ Junho/2021 - Julho/2023';
  @override
  String get fortlevExperienceInfo =>
    'Atuei no desenvolvimento do aplicativo "Mão Dupla" para gerenciamento de ordens de frete para a Fortlev.\n'
    'Colaborei com gerentes e usuários como Analista Desenvolvedor para coletar e definir requisitos funcionais e técnicos.\n\n'

    'O aplicativo se integra ao módulo SAP TM (Transport Management) para automatizar as operações entre os gestores do setor de carga e transporte, transportadoras, e motoristas parceiros. Suas principais funcionalidades são:\n'
    '▪ Autenticação de usuários.\n'
    '▪ Gestão de Ordens de Frete e Notas Fiscais.\n'
    '▪ Reporte de incidentes durante o trajeto.\n'
    '▪ Push Notifications para eventos relevantes.\n'
    '▪ Offline-first para operações sem conexão.\n'
    '▪ Recursos de ajuda/suporte como Contatos, Dicas e FAQ.';
  @override
  String get smartNewExperienceTitle => 'Desenvolvimento de Aplicação Flutter Mobile/Web';
  @override
  String get smartNewExperienceInfo => 'Prestei consultoria para o desenvolvimento do protótipo de uma aplicação mobile/web para a SmartNew, atuante no desenvolvimento de sistemas de monitoramento e gerenciamento de frotas. O objetivo era migrar a stack low-code.';
  @override
  String get mobileGameExperienceTitle => 'Design/Desenvolvimento de Jogos Casuais';
  @override
  String get mobileGameExperienceInfo =>
    'Desenvolvi um projeto pessoal de um jogo casual 2D para dispositivos móveis.\n\n'

    'Durante a fase de concepção, desenvolvi pequenos protótipos utilizando o Android SDK e Java com views nativas.\n\n'

    'A primeira versão do motor foi desenvolvida com Java/OpenGL ES 1.0. Uma segunda versão foi desenvolvida com OpenGL ES 2.0+.\n\n'

    'Para tornar o jogo multiplataforma, portei o código para C++ e fiz alguns experimentos com Unity/C#.';
  @override
  String get santriExperienceTitle => 'Desenvolvimento de Aplicação ERP';
  @override
  String get santriExperienceDetail => 'Santri Sistemas ▪ Outubro/2007 - Abril/2012';
  @override
  String get santriExperienceInfo =>
    'Contribuí para o desenvolvimento da aplicação cliente-servidor ADM utilizando Delphi (RAD Studio) e banco de dados Oracle com PL/SQL na Santri Sistemas.\n\n'

    'Analisei, especifiquei e implementei demandas dos clientes sob supervisão do Analista de Sistemas sênior.\n\n'

    'Como desenvolvedor mais experiente da equipe, minhas atribuições incluíam introduzir e auxiliar os novos membros com os padrões de desenvolvimento adotados.\n'
    'Liderei uma pequena equipe por um curto período antes de deixar a empresa.';
  @override
  String get smallErpExperienceTitle => 'Desenvolvimento de Aplicação ERP';
  @override
  String get smallErpExperienceInfo =>
    'Desenvolvi uma pequena aplicação cliente-servidor utilizando Delphi (RAD Studio) e banco de dados MySQL para uma loja de materiais para construção local.\n\n'

    'Este projeto me permitiu aplicar os conhecimentos que adquiria durante minha graduação e estudos independentes do livro Dominando o Delphi.';
  @override
  String get educationTitle => 'Formação';
  @override
  String get educationUniversityTitle => 'Redes de Computadores';
  @override
  String get educationUniversityDetail => 'Faculdade Estácio de Sá ▪ 2006 - 2008';
  @override
  String get educationUniversityInfo =>
    'O curso abordou os fundamentos teóricos e práticos de arquitetura de redes de computadores.\n\n'

    'Também incluiu: Sistemas Digitais, Sistemas Operacionais, Estrutura de Dados e Algoritmos, e uma introdução a linguagens de programação como C e Java.';
  @override
  String get professionalDevelopmentTitle => 'Desenvolvimento Profissional';
  @override
  String get certificationsTitle => 'Certificações';
  @override
  String get coursesTitle => 'Cursos';
  @override
  String get booksTitle => 'Livros';
  @override
  String get bookDelphiBibleTitle => 'Dominando o Delphi - A Bíblia';
  @override
  String get bookGoogleAndroidTitle => 'Google Android - Aplicações Móveis com o Android SDK';
  @override
  String get courseOracleTitle => 'Guia para os Exames de Certificação OCA/OCP Oracle';
  @override
  String get courseSapCloudIntegrationImmersionTitle => 'Imersão SAP Cloud Integration';
  @override
  String get verifyCertification => 'Verificar certificação';
  @override
  String get languagesTitle => 'Idiomas';
  @override
  String get languagesInfo =>
    'Português\n'
    '▪ Nativo - '
    'Inglês\n'
    '▪ Leitura avançada\n'
    '▪ Escrita intermediária\n'
    '▪ Conversação técnica intermediária';
  @override
  String get availabilityTitle => 'Disponibilidade';
  @override
  String get availabilityInfo =>
    'Contrato Pessoa Jurídica (PREFERÍVEL)\n'
    '▪ Fixo\n'
    '▪ Hora - '
    'Contrato CLT - '
    'Somente remoto - '
    'Freelance';
}