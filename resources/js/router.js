import Vue from 'vue'
import VueRouter from 'vue-router'

// ページコンポーネントをインポートする
import Top from './pages/Top.vue'
import Login from './pages/Login.vue'

// VueRouterプラグインを使用する
// これによって<RouterView />コンポーネントなどを使うことができる
Vue.use(VueRouter)

// パスとコンポーネントのマッピング
const routes = [
  {
    path: '/',
    component: Top
  },
  {
    path: '/login',
    component: Login
  }
]

// VueRouterインスタンスを作成する
const router = new VueRouter({
  routes
})

// VueRouterインスタンスをエクスポートする
// app.jsでインポートするため
export default router