// The e2e path runs on the seed data in ./seed until the web server below points at the app's start
// command; replace `command`, `url` and the seed when the repository has an app to run.
export default {
  testDir: '.',
  testMatch: '*.spec.mjs',
  use: { baseURL: 'http://127.0.0.1:4173' },
  webServer: {
    command: 'python3 -m http.server 4173 --bind 127.0.0.1 --directory seed',
    url: 'http://127.0.0.1:4173',
    reuseExistingServer: !process.env.CI,
  },
};
