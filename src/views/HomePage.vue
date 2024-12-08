<template>
  <div class="container mt-5">
    <!-- Swapneel Suhas Vaidya -->
    <!-- Home Page, Entry point for the application -->
    <div class="text-center">
      <h1>Welcome to the CS Department</h1>
      <p class="lead">
        Take our department 
        <router-link to="/surveypage">Survey</router-link> 
        and give us your feedback! You can check all the feedbacks on this 
        <router-link to="/listall">List</router-link>.
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomePage", // Ensure the component name follows multi-word naming convention
};
</script>

<style scoped>
.container {
  background: rgba(255, 255, 255, 0.6);
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  -webkit-backdrop-filter: blur(10px);
  backdrop-filter: blur(10px);
  position: absolute;
  top: 30%;
  left: 50%;
  transform: translateX(-50%);
  font-size: larger;
}

h1 {
  font-family: 'Playfair Display', serif;
  font-weight: 700;
  color: #006633;
  letter-spacing: 4px;
  display: flex;
  justify-content: center;
}
</style>
