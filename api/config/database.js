module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        host: env('DB_HOST', '10.111.192.3'),
        port: env('DB_PORT', 3306),
        database: env('DB_NAME', 'strapi'),
        username: env('DB_USERNAME' , 'root'),
        password: env('DB_PASSWORD', 'strapi')
      },
      options: {useNullAsDefault: true,}
    },
  },
});
