const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  outputDir: "../public",
  indexPath: "../app/views/general/index.html.erb"
})
