import 'strings.dart';

class StringsEn extends Strings {
  @override
  String get appName => 'Welcome to My Online Curriculum';
  @override
  String get flutterLongRole => 'Flutter Developer';
  @override
  String get integrationLongRole => 'SAP Integration Suite Developer';
  @override
  String get professionalSummaryTitle => 'Professional Summary';

  @override
  String get professionalSummaryInfo =>
    'Professional developer with over 15 years of experience working on client/server commercial '
    'applications (ERP), mobile applications for the Android platform, design/development of '
    'casual games, and cross-platform applications using the Flutter framework.';

  @override
  String get detailsTitle => 'Details';
  @override
  String get personalLocation => 'Brazil, GO';
  @override
  String get programmingSkillsTitle => 'Programming Skills';
  @override
  String get integrationSkillsTitle => 'Integration Skills';
  @override
  String get aboutAndExpectationsTitle => 'About Me and Expectations';

  @override
  String get aboutAndExpectationsInfo =>
    'A lover of digital illustration for games and passionate about the art of music.\n\n'

    'Always interested in learning more about any subject. When it comes to development, I '
    'prioritize sources such as books, official documentation, and articles.\n\n'

    'I always strive to do my best in everything I do, maintaining a high level of commitment '
    'to the quality of the final product. I value readability and performance, and that\'s why I '
    'chose Flutter as my cross-platform development framework.\n\n'

    'I hope to have the opportunity to participate in application development and/or system '
    'integration projects based on my demonstrated technical skills. While contributing my '
    'knowledge, I also hope to improve personally and technically alongside my teammates.';

  @override
  String get madeWithFlutter => 'Made with Flutter  🩵';
  @override
  String get experienceTitle => 'Experience';

  @override
  String get sapIntegrationSuiteLearningJourneyTitle =>
    'SAP Integration Suite Learning Journey';

  @override
  String get sapIntegrationSuiteLearningJourneyDetail => 'Since 2023';
  @override
  String get integrationProjectCalculatorTitle => 'Calculator';

  @override
  String get integrationProjectCalculatorDescription =>
    'Consume the public web service Calculator (http://www.dneonline.com/calculator.asmx).';

  @override
  String get integrationProjectCalculatorInfo =>
    '${Strings.widgetPlaceholderWithBreak}'

    'This iFlow implements a dynamic endpoint to support the four operations offered by the web '
    'service.\n\n'

    'The supported endpoints are:\n'
    '▪ https://<service-instance-URL>/http/calculator/add;\n'
    '▪ https://<service-instance-URL>/http/calculator/sub;\n'
    '▪ https://<service-instance-URL>/http/calculator/mult;\n'
    '▪ https://<service-instance-URL>/http/calculator/div.\n\n'

    'Unsupported operations return 404 (Not Found) in the CamelHttpResponseCode header.\n\n'

    'By reading the CamelHttpPath header, it is possible to identify the operation and configure '
    'the associated mappings and SOAP action:'

    '${Strings.widgetPlaceholderWithBreak}';

  @override
  String get integrationProjectConversionsAndFtpTitle => 'Conversions and FTP';

  @override
  String get integrationProjectConversionsAndFtpDescription =>
    'Convert the payload from/to different formats and save the result to an FTP server.';

  @override
  String get integrationProjectConversionsAndFtpInfo =>
    '${Strings.widgetPlaceholderWithBreak}'

    'This iFlow implements the most common conversions. The standard Content-Type header defines '
    'the source format. The customized Content-Type-To header defines the target format.\n\n'

    'The supported conversions are:\n'
    '▪ From text/csv to application/xml;\n'
    '▪ From application/json to application/xml;\n'
    '▪ From application/xml to text/csv;\n'
    '▪ From application/xml to application/json.\n\n'

    'Unsupported operations return 415 (Unsupported Media Type) in the CamelHttpResponseCode '
    'header.\n\n'

    'The result is saved to an FTP server configured via externalized parameters.\n\n'

    'For demonstration purposes, the conversions between XML and JSON formats include namespace '
    'mappings.\n\n'

    'JSON to XML:'

    '${Strings.widgetPlaceholderWithBreak}'
    '${Strings.widgetPlaceholderWithBreak}\n'

    'XML to JSON:'

    '${Strings.widgetPlaceholderWithBreak}'
    '${Strings.widgetPlaceholderWithBreak}';

  @override
  String get fortlevExperienceTitle => 'Flutter Mobile Application Development';
  @override
  String get fortlevExperienceDetail => 'BCI/Fortlev ▪ June/2021 - July/2023';

  @override
  String get fortlevExperienceInfo =>
    'I worked on the development of the "Mão Dupla" application for Freight Order management '
    'for the Fortlev company.\n'
    'The application aims to automate operations between the Freight and Transportation sector '
    'managers and Carrier and driver partners.\n\n'

    'As a Developer Analyst, I also contributed to functional and technical requirements '
    'gathering in collaboration with managers and users.\n\n'

    'The application has the main features:\n'
    '▪ User authentication;\n'
    '▪ Freight Orders and Invoices management;\n'
    '▪ Incident reporting during the journey;\n'
    '▪ Push Notifications for relevant events;\n'
    '▪ Offline First for no connection operations;\n'
    '▪ Help/support features such as Contacts, Tips, and FAQ.';

  @override
  String get smartNewExperienceTitle => 'Flutter Mobile/Web Application Development';

  @override
  String get smartNewExperienceInfo =>
    'In the first months of the year, I provided consulting services for the development of a '
    'mobile/web application prototype for SmartNew, which operates by developing fleet monitoring '
    'and management systems. The goal was to migrate the existing low-code stack.';

  @override
  String get mobileGameExperienceTitle => 'Design/Development of Casual Games';

  @override
  String get mobileGameExperienceInfo =>
    'I worked on a personal project of a 2D casual game for mobile devices.\n\n'

    'I developed small prototypes during the conception phase of the final project using Android '
    'SDK/Java with native views.\n\n'

    'The first version of the engine was developed using Java/OpenGL ES 1.0. A second version '
    'was developed using OpenGL ES 2.0.\n\n'

    'To turn the game multiplatform, I converted the code to C++. I also made some experiments '
    'with Unity/C#.';

  @override
  String get santriExperienceTitle => 'ERP Application Development';
  @override
  String get santriExperienceDetail => 'Santri Systems ▪ October/2007 - April/2012';

  @override
  String get santriExperienceInfo =>
    'At Santri Systems, I contributed to the development of the client/server application ADM '
    'using RAD Studio (Delphi) and the Oracle database with SQL/PL SQL.\n\n'

    'My role consisted of analyzing, specifying, and implementing the customer\’s requirements '
    'under the supervision of the Senior Systems Analyst.\n\n'

    'As the most experienced developer on the team, my responsibilities included introducing and '
    'assisting new members with the adopted development standards. I also led a small team for a '
    'short period before leaving the company.';

  @override
  String get smallErpExperienceTitle => 'ERP Application Development';

  @override
  String get smallErpExperienceInfo =>
    'I developed a small client/server application using RAD Studio (Delphi) and the MySQL '
    'database for a little building materials store in my city.\n\n'

    'In this project, I was able to apply the knowledge I was acquiring in my graduation and '
    'through individual studies of the book Mastering Delphi ▪ The Bible.';

  @override
  String get educationTitle => 'Education';
  @override
  String get educationUniversityTitle => 'Computer Networks';
  @override
  String get educationUniversityDetail => 'Estácio de Sá University ▪ 2006 - 2008';

  @override
  String get educationUniversityInfo =>
    'The course covered all the theoretical and practical fundamentals involved in computer '
    'network architecture.\n\n'

    'It also included: Digital Systems, Operating Systems, Data Structure & Algorithms, and an '
    'introduction to programming languages such as C and Java.';

  @override
  String get coursesAndBooksTitle => 'Relevant Courses and Books';
  @override
  String get coursesTitle => 'Courses';
  @override
  String get booksTitle => 'Books';
  @override
  String get bookDelphiBibleTitle => 'Mastering Delphi ▪ The Bible';

  @override
  String get bookGoogleAndroidTitle =>
    'Google Android ▪ Mobile Applications with the Android SDK';

  @override
  String get courseOracleTitle => 'Oracle OCA/OCP Certification Exams Guide';

  @override
  String get courseSapCloudIntegrationImmersionTitle =>
    'SAP Cloud Integration Immersion';

  @override
  String get languagesTitle => 'Languages';

  @override
  String get languagesInfo =>
    'Portuguese ▪ Native - '
    'English\n'
    '▪ Advanced reading\n'
    '▪ Intermediate writing\n'
    '▪ Intermediate technical conversation';

  @override
  String get availabilityTitle => 'Availability';

  @override
  String get availabilityInfo =>
    'Independent contract (PREFERABLE)\n'
    '▪ Fixed\n'
    '▪ Hour - '
    'Employee contract - '
    'Remote only - '
    'Freelance';
}