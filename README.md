# README

## Important Notice: Cluebase API No Longer Available
**As of August 2025, the Cluebase API that this project previously relied on is no longer in service.**

- All features that depended on fetching questions or clues from the Cluebase API will not function as intended.
- If you attempt to use endpoints or features that require external trivia data, you may encounter errors or empty results.

### Next Steps
- To restore full functionality, you will need to:
  - Replace the Cluebase API integration with another trivia/question API, or
  - Populate your own database of questions and clues.
- Contributions and suggestions for alternative data sources are welcome!

## Getting Started
1. **Clone the repository:**
	```sh
	git clone <repo-url>
	```
2. **Install dependencies:**
	```sh
	bundle install
	npm install
	```
3. **Set up the database:**
	```sh
	rails db:setup
	```
4. **Start the development server:**
	```sh
	bin/dev
	```

## Starting the Frontend (Vue.js)
The frontend is located in the `jeopardy_frontend/` directory and is built with Vue.js.

1. Open a new terminal window.
2. Navigate to the frontend directory:
	```sh
	cd jeopardy_frontend
	```
3. Install dependencies:
	```sh
	npm install
	```
4. Start the development server:
	```sh
	npm run serve
	```
5. The frontend will be available at the URL printed in your terminal (usually http://localhost:8080).

## Project Structure
- `app/` - Main Rails application code
- `jeopardy_frontend/` - Vue.js frontend (optional)
- `db/` - Database migrations and seeds

