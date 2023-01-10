import React from "react";
import logo from "./logo.svg";
import "./App.css";
import Todo from "./Todo";

function App() {
	return (
		<div className="App" >
			<Todo data-testId='todo' />
		</div>
	);
}

export default App;
