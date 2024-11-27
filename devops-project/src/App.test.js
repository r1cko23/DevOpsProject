import { render, screen } from '@testing-library/react';
import App from './App';

test('renders DevOps welcome message', () => {
    render(<App />);
    const linkElement = screen.getByText(/Welcome to the DevOps CI\/CD Pipeline/i);
    expect(linkElement).toBeInTheDocument();
});
