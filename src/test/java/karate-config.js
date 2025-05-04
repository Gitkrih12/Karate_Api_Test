function fn() {
 var env = karate.env; // get system property 'karate.env'
   if (!env)
   {
   env = 'test';
   }
 karate.log('********* Selected environment was *********** :', env);

  var config = {
    env: env,
    //reqResUrl: 'https://reqres.in',
    reqResUrl: 'https://gorest.co.in',
    mhBaseUrl: 'https://test-apicen-mh.mirrahealthcare.com',
    pvBaseUrl: 'https://test-apicen-pv.mirrahealthcare.com',
    mdmBaseUrl: 'https://test-apicen-mdm.mirrahealthcare.com',
//    tokenId:
    dbUsername: 'ADJ-RD',
    dbPassword: 'ADJRD@123456',
    dbUrl: 'jdbc:sqlserver://172.16.16.58;DatabaseName=MH_ADJ_VALOR_DB_TEST;trustServerCertificate=true',
    driverClassName: 'com.microsoft.sqlserver.jdbc.SQLServerDriver'
  }

  if (env == 'prod')
  {
//     config.baseUrl = 'https://gorest.co.in';
  } else if (env == 'uat')
  {
    //config.reqResUrl= 'https://reqres.in';
    config.reqResUrl= 'https://reqres.in';
    config.pvBaseUrl = 'https://uat-apicen-pv.mirrahealthcare.com';
    config.mhBaseUrl = 'https://uat-apicen-mh.mirrahealthcare.com';
    config.mdmBaseUrl = 'https://uat-apicen-mdm.mirrahealthcare.com';
  }
  else
  {
    //config.reqResUrl= 'https://reqres.in';
    config.reqResUrl = 'https://gorest.co.in';
    config.mhBaseUrl = 'https://test-apicen-mh.mirrahealthcare.com';
    config.pvBaseUrl = 'https://test-apicen-pv.mirrahealthcare.com';
    config.mdmBaseUrl = 'https://test-apicen-mdm.mirrahealthcare.com';
  }

  karate.configure('connectTimeout', 10000000);
  karate.configure('readTimeout', 10000000)

  return config;
}