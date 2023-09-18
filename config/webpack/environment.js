//const { environment } = require('@rails/webpacker')

//module.exports = environment

//const webpack = require('webpack')
//environment.plugins.prepend(
  //'Provide',
  //new webpack.ProvidePlugin({
    //$: 'jquery/src/jquery',
    //jQuery: 'jquery/src/jquery',
    //Popper: 'popper.js'
 // })
//)

//この記述内容をコピペ（もともとの記述は削除でOK）
//これは、webpackの設定ファイルでjQueryを管理下に追加するための記述です。
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
  })
)

module.exports = environment
