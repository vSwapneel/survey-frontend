<template>
  <div class="container mt-navbar">
    <!-- Swapneel Suhas Vaidya -->
    <!-- Contains the survey element -->
    <div class="header-box text-center">
      <h1>CS Department Survey</h1>
    </div>

    <div id="form-errors" class="error mt-3">{{ zipError }}</div>

    <form class="mt-4" @submit.prevent="onSubmit">
      <div class="mb-3 element">
        <label for="first-name" class="form-label">First Name:*</label>
        <input
          type="text"
          id="first-name"
          class="form-control"
          v-model="firstName"
          name="firstName"
          required
          placeholder="Enter first name"
          :disabled="!!surveyId"
        />
        <div v-if="formErrors.firstName" class="text-danger">
          First name is required.
        </div>
      </div>

      <div class="mb-3" element>
        <label for="last-name" class="form-label">Last Name:*</label>
        <input
          type="text"
          id="last-name"
          class="form-control"
          v-model="lastName"
          name="lastName"
          required
          placeholder="Enter last name"
          :disabled="!!surveyId"
        />
        <div v-if="formErrors.lastName" class="text-danger">
          Last name is required.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="telephone" class="form-label">Telephone Number:*</label>
        <input
          type="tel"
          id="telephone"
          class="form-control"
          v-model="telephone"
          name="telephone"
          required
          placeholder="Enter telephone number"
          pattern="^(\+?\d{1,4}|\d{1,4})?\s?\d{10}$"
          :disabled="!!surveyId"
        />
        <div v-if="formErrors.telephone" class="text-danger">
          Please enter a valid telephone number.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="email" class="form-label">Email Id:*</label>
        <input
          type="email"
          id="email"
          class="form-control"
          v-model="email"
          name="email"
          required
          placeholder="Enter Email Address"
          pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
          :disabled="!!surveyId"
        />
        <div v-if="formErrors.email" class="text-danger">
          Please enter a valid email address.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="survey-date" class="form-label">Date of Survey:*</label>
        <input
          type="date"
          id="survey-date"
          class="form-control"
          v-model="surveyDate"
          name="surveyDate"
          required
          :disabled="!!surveyId"
        />
        <div v-if="formErrors.surveyDate" class="text-danger">
          Date of survey is required.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="street" class="form-label">Street Address:*</label>
        <input
          type="text"
          id="street"
          class="form-control"
          v-model="street"
          name="street"
          required
          placeholder="1234 Main St"
          :disabled="!!surveyId"
        />
        <div v-if="formErrors.street" class="text-danger">
          Street address is required.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="zipcode" class="form-label">Zip Code:*</label>
        <input
          type="text"
          id="zipcode"
          class="form-control"
          v-model="zipcode"
          name="zipcode"
          required
          @blur="fetchLocationData(zipcode)"
          placeholder="Zip Code"
          :disabled="!!surveyId"
        />
        <div v-if="formErrors.zipcode" class="text-danger">
          Zip code is required.
        </div>
        <div id="zip-error" class="error">{{ zipError }}</div>
      </div>

      <div class="mb-3 element">
        <label for="city" class="form-label">City:</label>&nbsp;
        <span id="city">{{ city }}</span>
        <div v-if="formErrors.city" class="text-danger">
          City is required.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="state" class="form-label">State:</label>&nbsp;
        <span id="state">{{ state }}</span>
        <div v-if="formErrors.state" class="text-danger">
          State is required.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="recommend" class="form-label">Likelihood to Recommend:*</label>
        <select id="recommend" class="form-select" v-model="recommend" name="recommend" required>
          <option value="">Select</option>
          <option value="Very Likely">Very Likely</option>
          <option value="Likely">Likely</option>
          <option value="Unlikely">Unlikely</option>
        </select>
        <div v-if="formErrors.recommend" class="text-danger">
          Please select an option.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="likedMost" class="form-label">What did you like the most:*</label>
        <select id="likedMost" class="form-select" v-model="likedMost" name="likedMost" required>
          <option value="">Select</option>
          <option value="Campus">Campus</option>
          <option value="Department">Department</option>
          <option value="Location">Location</option>
        </select>
        <div v-if="formErrors.likedMost" class="text-danger">
          Please select an option.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="interestSource" class="form-label">Interest source:*</label>
        <select id="interestSource" class="form-select" v-model="interestSource" name="interestSource" required>
          <option value="">Select</option>
          <option value="Friends">Friends</option>
          <option value="Internet">Internet</option>
          <option value="Events">Events</option>
        </select>
        <div v-if="formErrors.interestSource" class="text-danger">
          Please select an option.
        </div>
      </div>

      <div class="mb-3 element">
        <label for="comments" class="form-label">Additional Comments:</label>
        <textarea
          id="comments"
          class="form-control"
          rows="4"
          v-model="comments"
          name="comments"
          placeholder="Enter any additional comments"
        ></textarea>
      </div>

      <button type="submit" class="btn btn-custom-yellow">Submit</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      firstName: "",
      lastName: "",
      telephone: "",
      email: "",
      surveyDate: "",
      street: "",
      zipcode: "",
      city: "",
      state: "",
      recommend: "",
      likedMost: "",
      interestSource: "",
      comments: "",
      zipError: "",
      surveyId: null, // dynamically determined, e.g., from props
      formErrors: {},
    };
  },
  created() {
    // Check if surveyId is available in route params
    this.surveyId = this.$route.params.id || null;

    if (this.surveyId) {
      this.fetchSurveyData(this.surveyId); // Fetch data if surveyId exists
    }
  },

  methods: {
    // Get Call
    async fetchSurveyData(id) {
      try {
        const response = await fetch(`http://ec2-34-193-155-170.compute-1.amazonaws.com:30678/api/surveys/${id}`);
        if (response.ok) {
          const data = await response.json();
          this.firstName = data.firstName;
          this.lastName = data.lastName;
          this.telephone = data.telephone;
          this.email = data.email;
          this.surveyDate = data.surveyDate;
          this.street = data.streetAddress;
          this.zipcode = data.zip;
          this.city = data.city;
          this.state = data.state;
          this.recommend = data.recommendation;
          this.likedMost = data.likedMost;
          this.interestSource = data.interestSource;
          this.comments = data.comments;
        } else {
          throw new Error("Survey data not found.");
        }
      } catch (error) {
        console.error("Error fetching survey data:", error);
        // Handle error, maybe show a message to the user
      }
    },

    // POST and PUT call
    async onSubmit() {
      if(this.zipError != ""){
        return
      }

      const formData = {
        firstName: this.firstName,
        lastName: this.lastName,
        streetAddress: this.street,
        city: this.city,
        state: this.state,
        zip: this.zipcode,
        telephone: this.telephone,
        email: this.email,
        surveyDate: this.surveyDate,
        likedMost: this.likedMost,
        interestSource: this.interestSource,
        recommendation: this.recommend,
        comments: this.comments,
      }

      const url = this.surveyId
        ? `http://localhost:8081/api/surveys/${this.surveyId}` // PUT URL if surveyId exists
        : "http://localhost:8081/api/surveys"; // POST URL if no surveyId

      const method = this.surveyId ? "PUT" : "POST"; // Use PUT if surveyId exists, else POST

      try {
        const response = await fetch(url, {
          method: method,
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(formData),
        });

        if (response.ok) {
          const data = await response.json();
          this.successMessage = "Form submitted successfully!";
          this.errorMessage = "";
          console.log("Response:", data);
          this.$router.push({ name: 'ListAll' });
        } else {
          throw new Error("Failed to submit the form. Please try again.");
        }
      } catch (error) {
        this.errorMessage = error.message;
        this.successMessage = "";
        console.error("Error:", error);
      }
      // console.log("Form submitted", this.$data);
    },

    // Fetch location by zipcode
    fetchLocationData(zipcode) {

      // Assuming you have a JSON file in the 'assets' folder
      import('@/assets/zipcodes.json')
        .then((data) => {
          // Find the location data by matching the zipcode
          const location = data.zipcodes.find(item => item.zip_code ===  Number(zipcode));

          if (location) {
            this.city = location.city;
            this.state = location.state;
            this.zipError = "";
            console.log("Location data:", location);
          } else {
            console.log("No data found for this zipcode");
            this.city = "";
            this.state = "";
            this.zipError = "Zipcode is incorrect";
          }
        })
        .catch(error => {
          console.error("Error fetching location data:", error);
          this.city = "";
          this.state = "";
          this.zipError = "Zipcode is incorrect";
        });
      },
  },
};
</script>

<style scoped>
/* Styling for survey page*/

.container {
  max-width: 800px;
  margin: auto;
  /* background: url('path_to_your_image.jpg') no-repeat center center / cover; */
  background: rgba(255, 255, 255, 0.6); /* If you want a semi-transparent background */
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px); /* Apply the blur only if needed */
}

input, select, textarea {
  width: 90%; /* Full width input fields */
  padding: 15px;
  margin-bottom: 15px;
  border: 2px solid #ddd; /* Light border color */
  border-radius: 5px;
  background-color: #fff;
  font-size: 1rem;
  font-family: Arial, sans-serif;
  transition: all 0.3s ease-in-out;
  margin-top: 10px;
}

input:focus, select:focus, textarea:focus {
  border-color: #006400; /* Change border color to green on focus */
  outline: none; /* Remove default outline */
}

.form-control {
  margin-bottom: 15px; /* Adjust space between inputs */
}


/* Header styling */
h1 {
  font-family: 'Playfair Display', serif;
  font-weight: 1000;
  color: #006633;
  letter-spacing: 4px;
}

/* Navbar styling */
.navbar {
  background-color: #333;
  color: white;
  padding: 15px;
  text-align: center;
  font-size: 20px;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
}

/* Header box style */
.header-box {
  border: 5px solid #006633;
  padding: 10px;
  box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.element {
  padding: 10px 0px;
}

/* Custom button style */
.btn-custom-yellow {
  background-color: #FFCC33;
  color: black;
  border: none;
  width: 100px;
  height: 50px;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.btn-custom-yellow:hover {
  background-color: #e6b82d;
}

/* Error text styling */
.error {
  color: red;
  font-size: 0.9em;
}

/* Margin adjustment for navbar */
.mt-navbar {
  margin-top: 120px;
}
</style>
