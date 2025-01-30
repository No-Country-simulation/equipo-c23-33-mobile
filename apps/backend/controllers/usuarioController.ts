import bcrypt from 'bcryptjs';
import { Request, Response } from 'express';
import { 
  addUsuario, 
  getUsuarios, 
  getUsuarioById, 
  updateUsuarioService, 
  deleteUsuarioService 
} from '../services/usuarioService';

// Endpoint de login
export const loginUsuario = async (req: Request, res: Response) => {
  try {
    const { email, contraseña } = req.body;

    // Buscar usuario por email
    const usuario = await getUsuarioById(email);
    if (!usuario) {
      return res.status(404).json({ error: 'Usuario no encontrado' });
    }

    // Verificar la contraseña
    const esCorrecta = bcrypt.compareSync(contraseña, usuario.contraseña);
    if (!esCorrecta) {
      return res.status(401).json({ error: 'Contraseña incorrecta' });
    }

    res.json({ message: 'Login exitoso', usuario });
  } catch (error) {
    console.error('Error en el login:', error);
    res.status(500).json({ error: 'Error en el login' });
  }
};

// Crear nuevo usuario
export const createUsuario = async (req: Request, res: Response) => {
  try {
    const usuarioId = await addUsuario(req.body);
    res.status(201).json({ id_user: usuarioId });
  } catch (error) {
    console.error("Error al crear usuario:", error);
    res.status(500).json({ error: 'Error al añadir el usuario' });
  }
};

// Listar todos los usuarios con filtros
export const listUsuarios = async (req: Request, res: Response) => {
  try {
    const filtros = req.query;
    const usuarios = await getUsuarios(filtros);
    res.json(usuarios);
  } catch (error) {
    console.error("Error al listar usuarios:", error);
    res.status(500).json({ error: "Error al listar los usuarios" });
  }
};

// Obtener un usuario por ID
export const getUsuario = async (req: Request, res: Response) => {
  try {
    const usuario = await getUsuarioById(req.params.id);
    if (!usuario) {
      return res.status(404).json({ error: 'Usuario no encontrado' });
    }
    res.json(usuario);
  } catch (error) {
    console.error("Error al obtener usuario:", error);
    res.status(500).json({ error: "Error al obtener el usuario" });
  }
};

// Actualizar usuario
export const updateUsuario = async (req: Request, res: Response) => {
  try {
    const updated = await updateUsuarioService(req.params.id, req.body);
    if (!updated) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }
    res.json({ message: "Usuario actualizado correctamente" });
  } catch (error) {
    console.error("Error al actualizar usuario:", error);
    res.status(500).json({ error: "Error al actualizar el usuario" });
  }
};

// Eliminar usuario
export const deleteUsuario = async (req: Request, res: Response) => {
  try {
    const deleted = await deleteUsuarioService(req.params.id);
    if (!deleted) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }
    res.json({ message: "Usuario eliminado correctamente" });
  } catch (error) {
    console.error("Error al eliminar usuario:", error);
    res.status(500).json({ error: "Error al eliminar el usuario" });
  }
};
