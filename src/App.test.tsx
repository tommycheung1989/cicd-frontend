import React from 'react';
import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const todo = screen.getByTestId('todo');
  expect(todo).toBeInTheDocument();
});
