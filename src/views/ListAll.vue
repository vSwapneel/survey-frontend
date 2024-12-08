<template>
    <div class="container">
      <h1>Survey Responses</h1>
      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Email</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>City</th>
              <th>State</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="survey in surveys" :key="survey.id">
              <td>{{ survey.email }}</td>
              <td>{{ survey.firstName }}</td>
              <td>{{ survey.lastName }}</td>
              <td>{{ survey.city }}</td>
              <td>{{ survey.state }}</td>
              <td>
                <router-link :to="`/surveypage/${survey.id}`" class="delete-edit-link">Edit</router-link>
              </td>
              <td>
                <button class="delete-edit-link" @click="confirmDelete(survey.id)">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "SurveyList",
    data() {
      return {
        surveys: [],
      };
    },
    created() {
      // Fetch the survey data when the component is created
      this.fetchSurveys();
    },
    methods: {
      async fetchSurveys() {
        try {
          const response = await fetch("http://localhost:8081/api/surveys");
          if (response.ok) {
            this.surveys = await response.json();
          } else {
            console.error("Failed to fetch surveys");
          }
        } catch (error) {
          console.error("Error fetching surveys:", error);
        }
      },
  
      async confirmDelete(id) {
        const confirmed = window.confirm("Are you sure you want to delete this survey?");
        if (confirmed) {
          this.onDelete(id);
        }
      },
  
      async onDelete(id) {
        try {
          const response = await fetch(`http://localhost:8081/api/surveys/${id}`, {
            method: "DELETE",
          });
  
          if (response.ok) {
            // Remove the deleted survey from the local list
            this.surveys = this.surveys.filter((survey) => survey.id !== id);
            alert("Survey deleted successfully.");
          } else {
            alert("Failed to delete the survey. Please try again.");
          }
        } catch (error) {
          console.error("Error deleting survey:", error);
          alert("An error occurred while deleting the survey.");
        }
      },
    },
  };
  </script>
  
  <style scoped>
  .container {
    max-width: 1000px;
    margin: auto;
    background: rgba(255, 255, 255, 0.6); /* Translucent white background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(10px); /* Adds a subtle blur to the background */
    margin-top: 40px;
  }
  
  h1 {
    font-family: "Playfair Display", serif;
    font-weight: 700;
    color: #006633;
    letter-spacing: 4px;
    text-align: center;
    margin-bottom: 20px;
  }
  
  .table-container {
    overflow-x: auto; /* Makes the table scrollable on smaller screens */
  }
  
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }
  
  th,
  td {
    padding: 20px;
    text-align: left;
    border: 1px solid #ccc;
  }
  
  th {
    padding: 25px;
    background-color: #006633; /* Dark green header */
    color: #fff;
    font-weight: bold;
  }
  
  tr:nth-child(even) {
    background-color: #f9f9f9; /* Light gray for alternate rows */
  }
  
  tr:hover {
    background-color: #f1f1f1; /* Slightly darker gray on hover */
  }

  .delete-edit-link {
    color: #551A8B;
    text-decoration: underline;
    padding: 0;
    border: 0px;
    background: transparent;
    cursor: pointer;
  }

  </style>
  