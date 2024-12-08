<template>
  <div class="main-body">
    <!-- Navigation Bar with Router Links -->
    <nav>
      <router-link to="/" class="nav-link">CS Department</router-link> |
      <router-link to="/surveypage" class="nav-link">Survey</router-link> |
      <router-link to="/listall" class="nav-link">List All</router-link>
    </nav>

    <!-- Router Outlet for Displaying Routed Components -->
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style>

  /* Ensure html and body take full height */
  html, body {
    height: 100%;
    margin: 0; /* Remove default margin */
    padding: 0; /* Remove default padding */
  }
    /* Apply background to main body container */
  .main-body {
    min-height: 100vh; /* Ensure content takes full viewport height */
    background-image: url('@/assets/Engg-Building.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    background-repeat: no-repeat;
    margin: 0;
    padding: 0;
    overflow-x: hidden;
  }

  /* Navigation Bar styles */
  nav {
    padding: 1em;
    background-color: #333;
    color: white;
    text-align: center;
  }

  .nav-link {
    color: white;
    margin: 0 1em;
    text-decoration: none;
  }

  .nav-link:hover {
    text-decoration: underline;
  }
</style>
