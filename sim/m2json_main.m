

m_path = 'data\test.m';

s = m2json(m_path);

out_str = jsonencode(s, PrettyPrint=true)