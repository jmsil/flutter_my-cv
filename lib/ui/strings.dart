class AppStrings {
  static const String _appNamePt = 'Meu CV';
  static const String _appNameEn = 'My CV';
  static String get appName => _select(_appNamePt, _appNameEn);

  static const String _rolePt = 'Desenvolvedor Flutter';
  static const String _roleEn = 'Flutter Developer';
  static String get role => _select(_rolePt, _roleEn);

  static const String _detailsPt = 'Detalhes';
  static const String _detailsEn = 'Details';
  static String get details => _select(_detailsPt, _detailsEn);

  static const String _brazilPt = 'Brasil, GO';
  static const String _brazilEn = 'Brazil, GO';
  static String get brazil => _select(_brazilPt, _brazilEn);

  static const String _skillsPt = 'Habilidades';
  static const String _skillsEn = 'Skills';
  static String get skills => _select(_skillsPt, _skillsEn);

  static const String _aboutExpecTitlePt = 'Sobre Mim/Expectativas';
  static const String _aboutExpecTitleEn = 'About Me/Expectations';
  static String get aboutAndExpectationsTitle => _select(_aboutExpecTitlePt, _aboutExpecTitleEn);


  static const String _aboutExpecTextPt =
    'Um grande apreciador de ilustração digital para jogos e apaixonado pela arte da música.\n\n'

    'Bastante auto-didata e sempre curioso para aprender algo sobre qualquer assunto. '
    'Sobre programação, prefiro fontes como livros, documentações oficiais, e artigos.\n\n'

    'Sempre busco dar o meu melhor no que faço, sendo altamente comprometido com a qualidade do '
    'produto final. Prezo por código legível e performático e, por isso, escolhi Flutter como '
    'meu framework para multiplataforma.\n\n'

    'Espero uma oportunidade de fazer parte de um grande projeto, robusto e bem estruturado, '
    'e de uma equipe na qual eu possa contribuir com minhas ideias e aprender mais com colegas '
    'mais experientes ao mesmo tempo.';
  static const String _aboutExpecTextEn =
    'A great appreciator of digital illustration for games and passionate about music art.\n\n'

    'Quite self-taught and always curious to learn something about anything. About '
    'programming, I prefer sources like books, officials documentations, and articles.\n\n'

    'I always pursuit doing better with everything I do, being highly committed to the final '
    'product quality. I cherish clean and high-performance code and, that is why I chose Flutter '
    'as my multiplatform framework.\n\n'

    'I hope to have an opportunity to be part of a great project, robust and well-structured, '
    'and a team in which I can contribute with my ideas and learn more from experienced teammates '
    'at the same time.';
  static String get aboutAndExpectationsText => _select(_aboutExpecTextPt, _aboutExpecTextEn);


  static const String _poweredByFlutterPt = 'Feito com Flutter';
  static const String _poweredByFlutterEn = 'Powered by Flutter';
  static String get powredByFlutter => _select(_poweredByFlutterPt, _poweredByFlutterEn);

  static const String _profSummaryTitlePt = 'Resumo Profissional';
  static const String _profSummaryTitleEn = 'Professional Summary';
  static String get professionalSummaryTitle => _select(_profSummaryTitlePt, _profSummaryTitleEn);


  static const String _profSummaryTextPt =
    'Desenvolvedor profissional com 15 anos de experiência atuando em aplicações comerciais '
    'cliente/servidor (ERP), aplicativos móveis para a plataforma Android, design/desenvolvimento '
    'de jogos casuais, e aplicações multiplataforma utilizando o framework Flutter.';
  static const String _profSummaryTextEn =
    'Professional developer with 15 years of experience working on client/server commercial '
    'applications (ERP), mobile applications for the Android platform, design/development of '
    'casual games, and multiplatform applications using the Flutter framework.';
  static String get professionalSummaryText => _select(_profSummaryTextPt, _profSummaryTextEn);


  static const String _profXpTitlePt = 'Experiência Profissional';
  static const String _profXpTitleEn = 'Professional Experience';
  static String get professionalExperienceTitle => _select(_profXpTitlePt, _profXpTitleEn);

  static const String _fortlevXpTitlePt = 'Aplicativo Flutter Mobile - BCI/Fortlev';
  static const String _fortlevXpTitleEn = 'Flutter Mobile Application - BCI/Fortlev';
  static String get fortlevExperienceTitle => _select(_fortlevXpTitlePt, _fortlevXpTitleEn);

  static const String _fortlevXpPeriodPt = 'Junho de 2021 - Janeiro de 2022';
  static const String _fortlevXpPeriodEn = 'June 2021 - January 2022';
  static String get fortlevExperiencePeriod => _select(_fortlevXpPeriodPt, _fortlevXpPeriodEn);


  static const String _fortlevXpTextPt =
    'Atuei no desenvolvimento do aplicativo "Mão Dupla" para gestão de Ordens de Frete para o '
    'cliente Fortlev.\n'
    'O objetivo é agilizar a interação entre os gestores do setor de cargas e transporte da '
    'Fortlev junto às Transportadoras e motoristas parceiros.\n\n'

    'Como Analista Desenvolvedor, também contribuí com levantamentos funcionais e técnicos junto '
    'aos gestores e usuários.\n\n'

    'O aplicativo conta com funcionalidades como:\n'
    '▪ Autenticação de usuários;\n'
    '▪ Gestão de Ordens de Frete;\n'
    '▪ Gestão das Notas Fiscais das OFs;\n'
    '▪ Inclusão de sinistros durante execução das OFs;\n'
    '▪ Push Notifications para operações de status;\n'
    '▪ Off-line First para informações inseridas pelo motorista durante execução das OFs;\n'
    '▪ Recursos de ajuda como Contatos, Dicas e FAQ.\n\n'

    'Conforme solicitado pelo cliente Fortlev, o desenvolvimento está paralizado para implantação '
    'do módulo SAP-TM e será retomado em breve.';
  static const String _fortlevXpTextEn =
    'I worked on the development of the "Mão Dupla" mobile application for Freight Orders '
    'management for the customer Fortlev.\n'
    'The goal is to expedite the interaction between the cargo and transport sector\'s managers '
    'of Fortlev along with Shipping Companies and partners drivers.\n\n'

    'As a Developer Analyst, I also contributed to identifying functional and technical '
    'prerequisites along with managers and users.\n\n'

    'The application has the main features:\n'
    '▪ User authentication;\n'
    '▪ Freight Orders management;\n'
    '▪ Freight Orders\' invoices management;\n'
    '▪ Inclusion of troubles during FOs execution;\n'
    '▪ Push Notifications for status operations;\n'
    '▪ Off-line First for informations inserted by drivers during FOs execution;\n'
    '▪ Help features like Contacts, Tips, and FAQ.\n\n'

    'As requested by the customer Fortlev, the development is paused due to the SAP-TM module '
    'integration and will be resumed soon.';
  static String get fortlevExperienceText => _select(_fortlevXpTextPt, _fortlevXpTextEn);


  static const String _flutterXpTitlePt = 'Desenvolvimento de Aplicação Flutter Mobile/Web';
  static const String _flutterXpTitleEn = 'Flutter Mobile/Web Application Development';
  static String get flutterExperienceTitle => _select(_flutterXpTitlePt, _flutterXpTitleEn);


  static const String _flutterXpTextPt =
    'Nos primeiros meses do ano, negociei o desenvolvimento de uma aplicação para um cliente '
    'que atua no ramo de prestação de serviço para empresas de mineração. O protótipo da '
    'aplicação está disponível no meu portfólio no GitHub.';
  static const String _flutterXpTextEn =
    'At the beginning of the year, I negotiated the development of an application for a customer '
    'who acts in the business of service supplying for mining companies. The prototype of the '
    'application is available in my portfolio on GitHub.';
  static String get flutterExperienceText => _select(_flutterXpTextPt, _flutterXpTextEn);


  static const String _mobGameXpTitlePt = 'Design/Desenvolvimento de Jogos Casuais';
  static const String _mobGameXpTitleEn = 'Design/Development of Casual Games';
  static String get mobileGameExperienceTitle => _select(_mobGameXpTitlePt, _mobGameXpTitleEn);


  static const String _mobGameXpTextPt =
    'Trabalhei em um projeto pessoal de um jogo casual 2D para dispositivos móveis.\n\n'

    'Desenvolvi pequenos protótipos durante a fase de concepção do projeto final utilizando '
    'Android SDK/Java com views nativas.\n\n'

    'A primeira versão do motor foi desenvolvida com Java/OpenGL ES 1.0. Uma segunda versão '
    'foi desenvolvida com OpenGL ES 2.0+.\n\n'

    'Para tornar o jogo multiplataforma, eu portei o código para C++ e fiz alguns experimentos '
    'com Unity/C#.';
  static const String _mobGameXpTextEn =
    'I worked on a personal project of a 2D casual game for mobile devices.\n\n'

    'I developed small prototypes during the conception phase of the final project using Android '
    'SDK/Java with native views.\n\n'

    'The first version of the engine was developed using Java/OpenGL ES 1.0. A second version was '
    'developed with OpenGL ES 2.0+.\n\n'

    'To make the game multiplatform, I converted the code to C++. I also did some experiments '
    'with Unity/C#.';
  static String get mobileGameExperienceText => _select(_mobGameXpTextPt, _mobGameXpTextEn);


  static const String _santriXpTitlePt = 'Desenvolvimento de Aplicação ERP - Santri Sistemas';
  static const String _santriXpTitleEn = 'ERP Application Development - Santri Systems';
  static String get santriExperienceTitle => _select(_santriXpTitlePt, _santriXpTitleEn);

  static const String _santriXpPeriodPt = 'Outubro de 2007 - Abril de 2012';
  static const String _santriXpPeriodEn = 'October 2007 - April 2012';
  static String get santriExperiencePeriod => _select(_santriXpPeriodPt, _santriXpPeriodEn);


  static const String _santriXpTextPt =
    'Na Santri Sistemas, eu contribuí para o desenvolvimento da aplicação cliente/servidor ADM '
    'utilizando RAD Studio (Delphi) e banco de dados Oracle com SQL/PL SQL.\n\n'

    'Meu papel consistia em analisar e implementar as requisições dos clientes junto ao Analista '
    'de Sistemas Sênior.\n\n'

    'Como principal desenvolvedor, minhas atribuições também incluíam introduzir e auxiliar os '
    'novos membros da equipe com os padrões de desenvolvimento adotados. Também liderei uma '
    'pequena equipe por um curto período antes de deixar a empresa.';
  static const String _santriXpTextEn =
    'At Santri Systems, I contributed to the development of the client/server application ADM '
    'using RAD Studio (Delphi) and Oracle database with SQL/PL SQL.\n\n'

    'My role consisted of analyzing and implementing the customer\'s requisitions along with the '
    'Senior Systems Analyst.\n\n'

    'As the main developer, my attributions also included introducing and assisting new teammates '
    'with adopted development patterns. I also led a small team for a short period before leaving '
    'the company.';
  static String get santriExperienceText => _select(_santriXpTextPt, _santriXpTextEn);


  static const String _smallErpTitlePt = 'Desenvolvimento de Aplicação ERP';
  static const String _smallErpTitleEn = 'ERP Application Development';
  static String get smallErpTitle => _select(_smallErpTitlePt, _smallErpTitleEn);


  static const String _smallErpTextPt =
    'Desenvolvi uma pequena aplicação cliente/servidor utilizando RAD Studio (Delphi) e banco de '
    'dados MySQL com um pequeno cliente em mente (Nenhum contrato foi fechado).';
  static const String _smallErpTextEn =
    'I developed a small client/server application using RAD Studio (Delphi) and MySQL database '
    'with a small customer in mind (the contract was not closed).';
  static String get smallErpText => _select(_smallErpTextPt, _smallErpTextEn);


  static const String _educationTitlePt = 'Formação';
  static const String _educationTitleEn = 'Education';
  static String get educationTitle => _select(_educationTitlePt, _educationTitleEn);

  static const String _eduUniTitlePt = 'Redes de Computadores - Faculdade Estácio de Sá';
  static const String _eduUniTitleEn = 'Computer Networks - Estácio de Sá University';
  static String get educationUniversityTitle => _select(_eduUniTitlePt, _eduUniTitleEn);


  static const String _eduUniTextPt =
    'O curso cobriu todos os conceitos teóricos e práticos envolvidos em arquitetura de redes de '
    'computadores.\n\n'
    'Também incluiu Sistemas Digitais, Sistemas Operacionais, Estrutura de Dados e Algoritimos, '
    'e introduziu linguagens de programação como C e Java.';
  static const String _eduUniTextEn =
    'The course covered all the theoretical and practical concepts behind computer network '
    'architecture.\n\n'
    'It also included Digital System, Operating Systems, Data Structure & Algorithms, and '
    'introduced us to programming languages like C and Java.';
  static String get educationUniversityText => _select(_eduUniTextPt, _eduUniTextEn);


  static const String _coursesBooksTitlePt = 'Cursos e Livros';
  static const String _coursesBooksTitleEn = 'Courses and Books';
  static String get coursesAndBooksTitle => _select(_coursesBooksTitlePt, _coursesBooksTitleEn);

  static const String _courseOracleTitlePt = 'Guia Para os Exames de Certificação OCA/OCP Oracle';
  static const String _courseOracleTitleEn = 'Oracle OCA/OCP Certification Exams Guide';
  static String get courseOracleOcaOcpTitle => _select(_courseOracleTitlePt, _courseOracleTitleEn);

  static const String _languageTitlePt = 'Idiomas';
  static const String _languageTitleEn = 'Languages';
  static String get languagesTitle => _select(_languageTitlePt, _languageTitleEn);

  static const String _languagePtTextPt = 'Português - Nativo';
  static const String _languagePtTextEn = 'Portuguese - Native';
  static String get languagePtText => _select(_languagePtTextPt, _languagePtTextEn);

  static const String _languageEnTextPt = 'Inglês - Intermediário';
  static const String _languageEnTextEn = 'English - Intermediate';
  static String get languageEnText => _select(_languageEnTextPt, _languageEnTextEn);

  static const String _availabilityTitlePt = 'Disponibilidade';
  static const String _availabilityTitleEn = 'Availability';
  static String get availabilityTitle => _select(_availabilityTitlePt, _availabilityTitleEn);

  static const String _availContractTextPt =
    'Contrato - preferência por remoto. Aberto a negociar presencial';
  static const String _avaiContractTextEn =
    'Contract - remote preferable. Open to negotiate in-office';
  static String get availabilityContractText => _select(_availContractTextPt, _avaiContractTextEn);

  static const String _availFreelaTextPt = 'Freelance';
  static const String _availFreelaTextEn = 'Freelance';
  static String get availabilityFreelanceText => _select(_availFreelaTextPt, _availFreelaTextEn);



  static String _langCode = '';
  static String get langCode => _langCode;

  static bool setLanguage(String languageCode) {
    bool changed = languageCode != _langCode;
    _langCode = languageCode;
    return changed;
  }

  static String _select(String pt, String en) {
    return _langCode == 'pt' ? pt : en;
  }
}