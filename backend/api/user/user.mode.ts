import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_API_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('Supabase URL or API key is not provided.');
}

const supabase = createClient('https://xfhjgjtviyqcmsvvmbas.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmaGpnanR2aXlxY21zdnZtYmFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI3MzI5NTUsImV4cCI6MTk4ODMwODk1NX0.cynDuO9vxKM6Yzo_UQJJ-5ePeATIY84ee2A3GmqvM8c');

// const userSchema = {
//   name: 'users',
//   columns: {
//     id: 'UUID',
//     name: 'TEXT',
//     email: 'TEXT',
//     password: 'TEXT',
//     picture: 'TEXT',
//     chats: 'UUID[]',
//     created_at: 'TIMESTAMP',
//     updated_at: 'TIMESTAMP',
//   },
// };

// const User = {
//   async create(email: String, password: String, chats: [], pictureUrl: String) {
//     let user = {
//       email: email,
//       password: password,
//       chats: chats,
//       picture: pictureUrl,
//     };
//     const { data, error } = await supabase
//       .from(userSchema.name)
//       .insert([{ ...user, created_at: new Date(), updated_at: new Date() }]);
//     if (error) {
//       throw new Error(error.message);
//     }
//     return data;
//   },

//   async findById(id: String) {
//     const { data, error } = await supabase
//       .from(userSchema.name)
//       .select('*')
//       .eq('id', id)
//       .single();
//     if (error) {
//       throw new Error(error.message);
//     }
//     return data;
//   },

//   async findByEmail(email: String) {
//     const { data, error } = await supabase
//       .from(userSchema.name)
//       .select('*')
//       .eq('email', email)
//       .single();
//     if (error) {
//       throw new Error(error.message);
//     }
//     return data;
//   },
// };

// export default User;


interface User {
  id: string;
  name: string;
  email: string;
  password: string;
  picture: string;
  created_at: string;
}

const createUser = async (user: User): Promise<User | null> => {
  const { data, error } = await supabase.from("users").insert([user]);
  if (error) {
    console.error("Error creating user:", error);
    return null;
  }
  return data?.[0] ?? null;
};

// find user by id
const findUserById = async (id: string): Promise<User | null> => {
  const { data, error } = await supabase.from("users").select("*").eq("id", id).single();
  if (error) {
    console.error("Error finding user by id:", error);
    return null;
  }
  return data[0] ?? null;
};

// find user by email
const findUserByEmail = async (email: string): Promise<User | null> => {
  const { data, error } = await supabase.from("users").select("*").eq("email", email).single();
  if (error) {
    console.error("Error finding user by email:", error);
    return null;
  }
  return data[1] ?? null;

};

// Other CRUD operations for User
