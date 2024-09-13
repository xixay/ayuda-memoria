import colors from 'vuetify/es5/util/colors'
import { red } from 'color-name'

export default {
  /*
  ** Nuxt rendering mode
  ** See https://nuxtjs.org/api/configuration-mode
  */
  spa: 'universal',
  /*
  ** Nuxt target
  ** See https://nuxtjs.org/api/configuration-target
  */
  target: 'server',
  /*
  ** Headers of the page
  ** See https://nuxtjs.org/api/configuration-head
  */
  head: {
    titleTemplate: '%s' + 'Contraloría General del Estado',
    title: 'Sistemas Internos - ' || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: process.env.npm_package_description || '' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress-bar color
  */
  loading: {
    color: '#01CAC0',
    height: '5px'
  },
  /*
  ** Global CSS
  */
  css: [
    '@/assets/global.scss',
    '@/assets/error.scss'
  ],
  /*
  ** Plugins to load before mounting the App
  ** https://nuxtjs.org/guide/plugins
  */
  plugins: [
    '~/plugins/storage.js',
    '~/plugins/vue-the-mask.js',
    '~/plugins/i18n.js',
    '~/plugins/service.js',
    '~/plugins/auth.js',
    '~/plugins/rules.js',
    '~/plugins/variables.js',
    '~/plugins/utils.js',
    '~/plugins/logHandler.js',
    '~/plugins/globalComponents.js',
    { src: '~/plugins/nuxt-quill-plugin.js', mode: 'client' }
  ],
  /*
  ** Auto import components
  ** See https://nuxtjs.org/api/configuration-components
  */
  components: true,
  /*
  ** Nuxt.js dev-modules
  */
  buildModules: [
    '@nuxtjs/vuetify',
  ],
  /*
  ** Nuxt.js modules
  */
  modules: [
    '@nuxtjs/toast',
    'nuxt-material-design-icons',
    'nuxt-polyfill',
    'nuxt-socket-io'
  ],
  io: {
    sockets: [{
      name: 'main',
      url: 'http://172.16.80.32:4002'
    }]
  },
  env: {
    ENVIROMENT: 'DESARROLLO',
    APP_NAME: 'sispoa',
    VERSION: 'v1.0.b',
    EXPIRE_SESSION_MINUTES: 100,
    APIS: {
      AUTH_CGE: 'http://172.16.80.82:4003/api/v1/',
      DEFAULT: 'http://localhost:7007/api/v1/',
      SISPOA: 'http://172.16.75.100:7091/',
    },
    LOGS_ARRAY: {
      MAXIMUM_SIZE_LOGS: 10,
      MAXIMUM_SIZE_WARNS: 10,
      MAXIMUM_SIZE_ERRORS: 10,
    },
    SELECCION_LENGUAJE_HABILITADA: false
  },
  server: {
    host: '0.0.0.0',
    port: 3000,
  },
  toast: {
    duration: 5000,
    position: 'top-right',
    keepOnHover: true,
    fullWidth: false,
    register: [
    ],
    action: {
      icon: 'close',
      class: 'action-toast',
      onClick: (e, toastObject) => {
        toastObject.goAway(0)
      }
    }
  },
  /*
  ** vuetify module configuration
  ** https://github.com/nuxt-community/vuetify-module
  */
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3,
          background: colors.grey.base
        },
        light: {
          primary: '#022F44',
          secondary: '#3A4F64',
          terciary: '#383635',
          accent: '#f39831',
          info: '#0288D1',
          warning: '#fbb800',
          error: '#e72c2c',
          success: '#8BC34A',
          background: '#f5f5f5'
        }
      }
    }
  },
  router: {
    middleware: ['rutas', 'i18n']
  },
  generate: {
    routes: ['/']
  },
  /*
  ** Build configuration
  ** See https://nuxtjs.org/api/configuration-build/
  */
  build: {
    postcss: null,
    /*
     ** You can extend webpack config here
     */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: "pre",
          test: /\.(js|vue)$/,
          loader: "eslint-loader",
          exclude: /(node_modules)/,
        })
      }
      config.module.rules.push({
        test: /\.(pdf)$/i,
        loader: "file-loader",
        options: {
          name: '[path][name].[ext]'
        }
      })
    },
    // vendor: ['babel-polyfill']
  },
  polyfill: {
    features: [
      {
        require: 'url-polyfill' // NPM package or require path of file
      },
      {
        require: 'intersection-observer',
        detect: () => 'IntersectionObserver' in window,
      },
      {
        require: 'smoothscroll-polyfill',
        detect: () => 'scrollBehavior' in document.documentElement.style && window.__forceSmoothScrollPolyfill__ !== true,
        install: (smoothscroll) => smoothscroll.polyfill()
      }
    ]
  },
  script: [
    { src: 'https://cdn.polyfill.io/v2/polyfill.min.js' },
  ],
  subdirectory: true
}
