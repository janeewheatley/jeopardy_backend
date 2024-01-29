<template>
  <div class="text-white body-div">
    <div>
      <ClueComponent :clues="clues" :category="category" />
    </div>
    <div>
      <ResponseComponent
        :on-submit="submitCallback"
        @on-user-answer="storeAnswerCallback"
        :display-answer="displayAnswer"
        :disable-text-field="disableTextField"
        :disable-submit-btn="disableSubmitBtn"
        v-model="textAreaValue"
        :response-valid="responseValid"
        :response-invalid="responseInvalid"
      />
    </div>
    <div class="next flex-row-reverse p-2">
      <NextComponent
        @on-next-question="questionCallback"
        :disable-next-btn="disableNextBtn"
      />
    </div>
    <div class="next flex-row-reverse p-2">
      <CounterComponent />
    </div>
  </div>

  <div>
    <footer class="py-2">
      <p class="text-center text-muted">© 2023 Jane Wheatley</p>
    </footer>
  </div>
</template>

<style>
.body-div {
  background-color: #013adf;
  padding-top: 8em;
  height: 100vh;
}

.clue-word {
  font-size: 2em;
}

.response {
  padding-top: 30px;
  padding-bottom: -30px;
}

.mb-0 {
  font-size: 300px;
  font-family: Gyparody;
}
</style>

<script>
import ClueComponent from "@/components/ClueComponent.vue";
import ResponseComponent from "@/components/ResponseComponent.vue";
import NextComponent from "@/components/NextComponent.vue";
import CounterComponent from "@/components/CounterComponent.vue";
import { useClueStore } from "./stores/ClueStore";
import { useCounterStore } from "./stores/CounterStore";
import axios from "axios";

export default {
  components: {
    ClueComponent,
    ResponseComponent,
    NextComponent,
    CounterComponent,
  },
  data() {
    return {
      displayAnswer: false,
      displayCounterCorrect: 0,
      displayCounterTotal: 0,
      alreadyAnswered: false,
      disableTextField: false,
      disableSubmitBtn: false,
      disableNextBtn: true,
    };
  },
  methods: {
    submitCallback(userAnswerValue) {
      this.displayAnswer = true;
      const store = useClueStore();
      const counterStore = useCounterStore();

      this.disableSubmitBtn = true;
      this.alreadyAnswered = true;
      this.disableTextField = true;
      this.disableNextBtn = false;
      counterStore.incrementCounterTotal();

      if (!this.compareResponses(userAnswerValue, store.response)) {
        this.responseValid = false;
        this.responseInvalid = true;
        this.disableTextField = true;
        this.disableSubmitBtn = true;
      } else {
        this.responseValid = true;
        this.responseInvalid = false;
        this.displayAnswer = false;
        counterStore.incrementCounterCorrect();
        this.disableSubmitBtn = true;
      }
      this.submitResponse(store.clues, userAnswerValue, this.responseValid);
      this.submitQuestion(store.api_id, userAnswerValue, this.responseValid);
    },
    storeAnswerCallback() {
      const textAreaValue =
        document.getElementsByClassName("form-control")[0].value;

      if (textAreaValue == "") {
        this.disableSubmitBtn = true;
      } else {
        this.disableSubmitBtn = false;
      }
    },

    questionCallback() {
      useClueStore().fetchClues();
      this.emitter.emit("on-next");
      this.displayAnswer = false;
      this.responseValid = false;
      this.responseInvalid = false;
      this.disableTextField = false;
      this.disableSubmitBtn = true;
      this.disableNextBtn = true;
    },

    compareResponses(userAnswer, realAnswer) {
      const normalizedUserAnswer = this.normalizeResponse(userAnswer);
      const normalizedRealAnswer = this.normalizeResponse(realAnswer);
      return normalizedUserAnswer === normalizedRealAnswer;
    },

    normalizeResponse(response) {
      let newResponse = "" + response;
      return newResponse.toLowerCase().replace(/\s/g, "");
    },
    submitResponse(question, answer, result) {
      axios.post("http://localhost:3000/games", {
        question: question,
        answer: answer,
        result: result,
      });
    },
    submitQuestion(question, answer, result) {
      axios.post("http://localhost:3000/questions", {
        question: question,
        answer: answer,
        result: result,
      });
    },
  },
  mounted() {
    useClueStore().fetchClues();
    axios
      .post("http://localhost:3000/sign_in", {
        email: "jelwheatley@gmail.com",
        password: "Password",
      })
      .then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
  },
};
</script>

