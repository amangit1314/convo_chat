import { createClient } from '@supabase/supabase-js';

const supabaseUrl: string = process.env.SUPABASE_URL;
const supabaseKey: string = process.env.SUPABASE_API_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const userSchema = {
  name: 'users',
  columns: {
    id: 'UUID',
    name: 'TEXT',
    email: 'TEXT',
    password: 'TEXT',
    picture: 'TEXT',
    chats: 'UUID[]',
    created_at: 'TIMESTAMP',
    updated_at: 'TIMESTAMP',
  },
};

const User = {
  async create(email: String, password: String, chats: [], pictureUrl: String) {
    let user = {
      email: email,
      password: password,
      chats: chats,
      picture: pictureUrl,
    };
    const { data, error } = await supabase
      .from(userSchema.name)
      .insert([{ ...user, created_at: new Date(), updated_at: new Date() }]);
    if (error) {
      throw new Error(error.message);
    }
    return data;
  },

  async findById(id: String) {
    const { data, error } = await supabase
      .from(userSchema.name)
      .select('*')
      .eq('id', id)
      .single();
    if (error) {
      throw new Error(error.message);
    }
    return data;
  },

  async findByEmail(email: String) {
    const { data, error } = await supabase
      .from(userSchema.name)
      .select('*')
      .eq('email', email)
      .single();
    if (error) {
      throw new Error(error.message);
    }
    return data;
  },
};

export default User;
