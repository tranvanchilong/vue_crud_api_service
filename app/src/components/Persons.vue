<template>
  <div class="container">
    <h1>Person API CRUD</h1>
    <div>
      <button @click="showForm = true">Add Person</button>
      <div v-if="showForm">
        <label for="name">Name:</label>
        <input type="text" v-model="newPerson.name">
        <label for="age">Age:</label>
        <input type="text" v-model="newPerson.age">
        <label for="address">Address:</label>
        <input type="text" v-model="newPerson.address">
        <label for="phone">Phone Number:</label>
        <input type="text" v-model="newPerson.phone_number">
        <label for="email">Email:</label>
        <input type="text" v-model="newPerson.email">
        <label for="companyId">Company ID:</label>
        <input type="text" v-model="newPerson.id_company">
        <button @click="addPerson">Save</button>
        <button @click="showForm = false">Cancel</button>
      </div>
    </div>
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Name</th>
          <th scope="col">Age</th>
          <th scope="col">Address</th>
          <th scope="col">Phone Number</th>
          <th scope="col">Email</th>
          <th scope="col">Company ID</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="person in persons" :key="person.id">
          <td>{{ person.id }}</td>
          <td>{{ person.name }}</td>
          <td>{{ person.age }}</td>
          <td>{{ person.address }}</td>
          <td>{{ person.phone_number }}</td>
          <td>{{ person.email }}</td>
          <td>{{ person.id_company }}</td>
          <td>
            <button @click="editPerson(person)">Edit</button>
            <button @click="deletePerson(person)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
    <div v-if="editingPerson">
      <h2>Edit Person</h2>
      <label for="editName">Name:</label>
      <input type="text" v-model="editingPerson.name" id="editName">
      <label for="editAge">Age:</label>
      <input type="text" v-model="editingPerson.age" id="editAge">
      <label for="editAddress">Address:</label>
      <input type="text" v-model="editingPerson.address" id="editAddress">
      <label for="editPhoneNumber">Phone Number:</label>
      <input type="text" v-model="editingPerson.phone_number" id="editPhoneNumber">
      <label for="editEmail">Email:</label>
      <input type="text" v-model="editingPerson.email" id="editEmail">
      <label for="editCompanyId">Company ID:</label>
      <input type="text" v-model="editingPerson.id_company" id="editCompanyId">
      <button @click="updatePerson">Update</button>
      <button @click="cancelEdit">Cancel</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      persons: [],
      showForm: false,
      newPerson: {
        name: '',
        age: '',
        address: '',
        phone_number: '',
        email: '',
        id_company: '',
      },
      editingPerson: null,
    };
  },
  methods: {
    getPersons() {
      const path = 'http://139.162.28.246:5002/person/';
      axios.get(path)
        .then((res) => {
          this.persons = res.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    addPerson() {
      const path = 'http://139.162.28.246:5002/person/';
      axios.post(path, this.newPerson)
        .then(() => {
          this.getPersons();
          this.newPerson = {
            name: '',
            age: '',
            address: '',
            phone_number: '',
            email: '',
            id_company: '',
          };
        })
        .catch((error) => {
          console.error(error);
        });
    },
    // addPerson(payload) {
    //   const path = 'http://localhost:5000/person/';
    //   axios.post(path, payload)
    //     .then(() => {
    //       this.getPersons();
          
    //       // for message alert
    //       this.message = 'Game added 🕹️ !';
          
    //       // to show message when game is added
    //       this.showMessage = true;
  
    //     })
    //     .catch((error) => {
    //       console.log(error);
    //       this.getPersons();
    //     });
    // },
    editPerson(person) {
      this.editingPerson = { ...person };
    },
    updatePerson() {
      const path = `http://139.162.28.246:5002/person/${this.editingPerson.id}`;
      axios.put(path, this.editingPerson)
        .then(() => {
          this.getPersons();
          this.editingPerson = null;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    deletePerson(person) {
      const path = `http://139.162.28.246:5002/person/${person.id}`;
      axios.delete(path)
        .then(() => {
          this.getPersons();
        })
        .catch((error) => {
          console.error(error);
        });
    },
    cancelEdit() {
      this.editingPerson = null;
    },
  },
  created() {
    this.getPersons();
  },
};
</script>