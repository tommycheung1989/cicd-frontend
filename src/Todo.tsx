import { useState } from "react";

export default function Todo() {
	const [todo, setTodo] = useState("");
	return (
		<>
			<h1>Todo List Page</h1>
			<p>tell me what you want to add: </p>
			<form action="submit">
				<input type="text" onChange={(e) => setTodo(e.target.value)} />
				<button
					type="submit"
					onClick={(e) => {
						e.preventDefault();
						console.log(todo);
					}}
				>
					add!
				</button>
			</form>
		</>
	);
}
