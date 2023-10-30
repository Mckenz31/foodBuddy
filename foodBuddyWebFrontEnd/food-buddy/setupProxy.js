const { createProxyMiddleware } = require("http-proxy-middleware");

module.exports = function (app) {
  // Replace 'http://localhost:3000' with your React app's URL.
  app.use(
    "/api",
    createProxyMiddleware({
      target: "http://localhost:3000",
      changeOrigin: true,
    })
  );
};
