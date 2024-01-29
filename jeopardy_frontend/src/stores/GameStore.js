import { defineStore } from "pinia";

export const useGameStore = defineStore("GameStore", {
  state: () => ({
    game_id: 0,
    category: [],
    response: [],
  }),
  mutations: {
    setGameId(state, new_game_id) {
      state.game_id = new_game_id;
    },
  },
});
