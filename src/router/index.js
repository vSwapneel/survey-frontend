import { createRouter, createWebHistory } from 'vue-router';
import HomePage from '../views/HomePage.vue';
import SurveyPage from '../views/SurveyPage.vue';
import ListAll from '../views/ListAll.vue';

const routes = [
  { path: '/', name: 'HomePage', component: HomePage },
  { path: '/surveypage/:id?', name: 'SurveyPage', component: SurveyPage },
  { path: '/listall', name: 'ListAll', component: ListAll },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
