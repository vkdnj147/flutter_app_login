const bool isProduction = bool.fromEnvironment('dart.vm.product');

const devConfig = {
  'baseUrl': 'http://127.0.0.1:8080',
 // 'baseUrl': 'http://192.168.56.101:8080',
};

const productionConfig = {
  'baseUrl': 'http://127.0.0.1:8080',
 // 'baseUrl': 'http://192.168.56.101:8080',
};

final environment = isProduction ? productionConfig : devConfig;
