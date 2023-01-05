export default function Todo() {
	return (
		<>
			<h1>Todo List Page</h1>
			<p>tell me what you want to add: </p>
			<form action="submit">
				<input type="text" />
				<button type="submit">add!</button>
			</form>
		</>
	);
}
