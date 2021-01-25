module.exports = ({ env }) => ({
  admin: {
    auth: {
      secret: "23f96339-ce6f-4fe0-a110-87fb169a8e9d",
    },
  },
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  cron: {
    enabled: true
  }
});
