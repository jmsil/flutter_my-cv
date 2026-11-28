abstract class Strings({
  required final String appName,
  required final String roles,
  required final String professionalSummaryTitle,
  required final String professionalSummaryInfo,
  required final String detailsTitle,
  required final String personalLocation,
  required final String programmingSkillsTitle,
  required final String integrationSkillsTitle,
  required final String aboutAndExpectationsTitle,
  required final String aboutAndExpectationsInfo,
  required final String madeWithFlutter,
  required final String language,
  required final String theme,
  required final String download,
  required final String downloadCv,
  required final String coverLetter,
  required final String company,
  required final String summary,
  required final String portfolio,
  required final String verify,
  required final String experienceTitle,
  required final String sapIsLearningJourneyTitle,
  required final String sapIsLearningJourneyInfo,
  required final String sapIsProjectApimProxyDescription,
  required final String sapIsProjectApimProxyInfo,
  required final String sapIsProjectIFlowProxyDescription,
  required final String sapIsProjectIFlowProxyInfo,
  required final String sapIsProjectExceptionHandlerDescription,
  required final String sapIsProjectExceptionHandlerInfo,
  required final String sapIsProjectOAuth2TokensHandlerDescription,
  required final String sapIsProjectOAuth2TokensHandlerInfo,
  required final String sapIsProjectGoogleFirebaseAuthUsersDescription,
  required final String sapIsProjectGoogleFirebaseAuthUsersInfo,
  required final String sapIsProjectInterStatementOauth2MtlsDescription,
  required final String sapIsProjectInterStatementOauth2MtlsInfo,
  required final String sapIsProjectSqlServerWithXsltDescription,
  required final String sapIsProjectSqlServerWithXsltInfo,
  required final String sapIsProjectConversionsAndFtpDescription,
  required final String sapIsProjectConversionsAndFtpInfo,
  required final String sapIsProjectMappingsDescription,
  required final String sapIsProjectMappingsInfo,
  required final String sapIsProjectCalculatorDescription,
  required final String sapIsProjectCalculatorInfo,
  required final String sapIsProjectsScriptCollectionInfo,
  required final String fortlevExperienceTitle,
  required final String fortlevExperienceInfo,
  required final String fortlevProjectMaoDuplaTitle,
  required final String fortlevProjectMaoDuplaDescription,
  required final String smartNewExperienceTitle,
  required final String smartNewExperienceInfo,
  required final String mobileGameExperienceTitle,
  required final String mobileGameExperienceDetail,
  required final String mobileGameExperienceInfo,
  required final String santriExperienceTitle,
  required final String santriExperienceDetail,
  required final String santriExperienceInfo,
  required final String smallErpExperienceTitle,
  required final String smallErpExperienceInfo,
  required final String educationTitle,
  required final String educationUniversityTitle,
  required final String educationUniversityDetail,
  required final String educationUniversityInfo,
  required final String professionalDevelopmentTitle,
  required final String certificationsTitle,
  required final String coursesTitle,
  required final String booksTitle,
  required final String bookDelphiBibleTitle,
  required final String bookGoogleAndroidTitle,
  required final String courseOracleTitle,
  required final String courseSapCloudIntegrationImmersionTitle,
  required final String languagesTitle,
  required final Map<String, List<String>?> languagesInfo,
  required final String availabilityTitle,
  required final Map<String, List<String>?> availabilityInfo,
  required final String visitOnlineResume
}) {
  static const String splitTag = '<spt>';
  static const String titleTag = '<ttl>';
  static const String widgetTag = '<wdg>';
  static const String widgetPlaceholder = '$splitTag$widgetTag$splitTag';
  static String title(String title) => '$splitTag$titleTag$title$splitTag';
  static const String pipeJoiner = ' | ';

  static const String personalName = 'João Marques da Silva';
  static const String shortRoles =
    'Flutter\n'
    'SAP Integration Suite';
  static const String personalPhone = '+55 62 99497-1154';
  static const String personalPhoneLink = 'https://api.whatsapp.com/send?phone=5562994971154';
  static const String personalEmail = 'jmsilva.inbox@gmail.com';
  static const String personalEmailLink = 'mailto:$personalEmail';
  static const String personalGitHubLink = 'https://github.com/jmsil';
  static const String personalCvLink = 'https://flutter-my-cv.firebaseapp.com';
  static const List<String> programmingSkillsInfo = ['Dart/Flutter', 'Android SDK', 'Java', 'Groovy', 'C/C++', 'Oracle Database', 'MySQL Database', 'PL/SQL', 'Git'];
  static const List<String> integrationSkillsInfo = ['SAP Cloud Integration', 'SAP API Management', 'SAP (Advanced) Event Mesh'];
  static const String ok = 'Ok';
  static const String languagePt = 'Pt';
  static const String languageEn = 'En';
  static const String layout = 'Layout';
  static const String sapIsLearningJourneyDetail = '03/2025 - 07/2026';
  static const String sapIsProjectApimProxyTitle = 'API Management Proxy';
  static const String sapIsProjectIFlowProxyTitle = 'Integration Flow Proxy';
  static const String sapIsProjectExceptionHandlerTitle = 'Exception Handler';
  static const String sapIsProjectOAuth2TokensHandlerTitle = 'OAuth2 Tokens Handler';
  static const String sapIsProjectGoogleFirebaseAuthUsersTitle = 'Google Firebase Auth Users';
  static const String sapIsProjectInterStatementOauth2MtlsTitle = 'Inter Statement with OAuth2 and mTLS';
  static const String sapIsProjectSqlServerWithXsltTitle = 'SQL Server with XSLT';
  static const String sapIsProjectConversionsAndFtpTitle = 'Conversions and FTP';
  static const String sapIsProjectMappingsTitle = 'Mappings';
  static const String sapIsProjectCalculatorTitle = 'Calculator';
  static const String fortlevExperienceDetail = 'BCI Consulting/Fortlev ▪ 06/2021 - 07/2023';
  static const String bciShortLink = 'BCI Consulting.com';
  static const String bciLink = 'https://www.bci-consulting.com';
  static const String fortlevShortLink = 'Fortlev.com';
  static const String fortlevLink = 'https://www.fortlev.com.br';
  static const String smartNewExperienceDetail = 'SmartNew System ▪ 01/2021 - 05/2021';
  static const String smartNewShortLink = 'SmartNew System.com';
  static const String smartNewLink = 'https://telemetria.smartnewsystem.com';
  static const String santriShortLink = 'Santri.com';
  static const String santriLink = 'https://www.santri.com.br';
  static const String smallErpExperienceDetail = 'Freelance ▪ 2006 - 2007';
  static const String educationUniversityShortLink = 'Estacio.com';
  static const String educationUniversityLink = 'https://estacio.br';
  static const String bookDelphiBibleDetail = 'Marco Cantù';
  static const String bookGoogleAndroidDetail = 'Ricardo R. Lecheta';
  static const String bookCleanCodeTitle = 'Clean Code - A Handbook of Agile Software Craftsmanship';
  static const String bookCleanArchitectureTitle = 'Clean Architecture - A Craftsman\'s Guide to Software Structure and Design';
  static const String booksCleanCodeArchDetail = 'Robert C. Martin';
  static const String bookEnterpriseIntegrationPatternsTitle = 'Enterprise Integration Patterns';
  static const String bookEnterpriseIntegrationPatternsDetail = 'Gregor Hohpe & Bobby Woolf';
  static const String courseOracleDetail = '2010';
  static const String certificationCcpiTitle = 'SAP Certified - Integration Developer (C_CPI)';
  static const String certificationCcpiDetail = 'SAP';
  static const String certificationCcpiLink = 'https://www.credly.com/badges/76ba4a5b-f8c8-430d-a088-a887e6b90d04/public_url';
  static const String courseSapCloudIntegrationImmersionDetail = 'Moovi Education ▪ 05/2025';
  static const String courseSapCloudIntegration20Title = 'SAP Cloud Integration 2.0';
  static const String courseSapCloudIntegration20Detail = 'Moovi Education ▪ 06/2025';
  static const String courseSapCloudIntegration20CertificateLink = '${_mooviEducationCertificateHost}d39e6da5e22b2a29ae86168057db8b2c67be7ac8';
  static const String courseSapApiManagementTitle = 'SAP API Management';
  static const String courseSapApiManagementDetail = 'Moovi Education ▪ 06/2025';
  static const String courseSapApiManagementCertificateLink = '${_mooviEducationCertificateHost}54f002745e63e1413e492e1a0d0414df4358c946';
  static const String courseSapAdvancedEventMeshTitle = 'SAP Advanced Event Mesh';
  static const String courseSapAdvancedEventMeshDetail = 'Moovi Education ▪ 12/2025';
  static const String courseSapAdvancedEventMeshCertificateLink = '${_mooviEducationCertificateHost}dd05be54712a1ed6487e3a00511c26c7505cc76c';
  static const String mooviEducationCoursesDetail = 'Moovi Education';
  static const String _mooviEducationCertificateHost = 'https://moovi.curseduca.pro/verify/';

  List<String> coverLetterSapIsInfo(String companyName);
}