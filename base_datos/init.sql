CREATE TABLE IF NOT EXISTS cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  detalle TEXT NULL,
  precio DECIMAL(10,2) NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS imagenes_curso (
  id INT AUTO_INCREMENT PRIMARY KEY,
  curso_id INT NOT NULL,
  url VARCHAR(255) NOT NULL,
  alt VARCHAR(120) NULL,
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE IF NOT EXISTS clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  email VARCHAR(120) NOT NULL,
  celular VARCHAR(40) NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_cliente_email_celular (email, celular)
);

CREATE TABLE IF NOT EXISTS compras (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE IF NOT EXISTS items_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compra_id INT NOT NULL,
  curso_id INT NOT NULL,
  precio_al_comprar DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (compra_id) REFERENCES compras(id),
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO cursos (nombre, descripcion, detalle, precio) VALUES
('Panadería Artesanal', 'Aprendé panes y masas', 'Temario completo de panadería artesanal', 12000.00),
('Pastelería Básica', 'Tortas y rellenos', 'Bizcochuelos, cremas y decoración', 15000.00),
('Cocina Italiana', 'Pastas y salsas', 'Pastas frescas, salsas clásicas', 18000.00);

INSERT INTO imagenes_curso (curso_id, url, alt) VALUES
(1, 'https://picsum.photos/seed/pan/600/400', 'Panadería'),
(2, 'https://picsum.photos/seed/past/600/400', 'Pastelería'),
(3, 'https://picsum.photos/seed/italy/600/400', 'Italiana');
