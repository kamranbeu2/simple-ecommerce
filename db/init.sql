-- Create the Users table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Create the Products table
CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Insert sample data into Users table
INSERT INTO users (username, password, email)
VALUES 
    ('john_doe', 'password123', 'john@example.com'),
    ('jane_doe', 'securepass', 'jane@example.com');

-- Insert sample data into Products table
INSERT INTO products (name, description, price)
VALUES
    ('Smartphone', 'A powerful smartphone with the latest features.', 699.99),
    ('Laptop', 'A sleek laptop for professionals.', 1299.49);

-- Grant privileges on the database and tables
GRANT ALL PRIVILEGES ON DATABASE ecommerce TO "db-user";
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "db-user";

-- Grant USAGE on sequences (using the automatically generated sequence names)
GRANT USAGE ON SEQUENCE users_id_seq TO "db-user";
GRANT USAGE ON SEQUENCE products_id_seq TO "db-user";