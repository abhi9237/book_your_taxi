class Env {
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://wuqrdkgcetwrvoelvnji.supabase.co',
  );

  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind1cXJka2djZXR3cnZvZWx2bmppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzcxMDY5MTEsImV4cCI6MjA5MjY4MjkxMX0.jRVpVTY9_iLSHgTBGzfQgFfPebJSCIzbz-ytck1v5ac',
  );
}
