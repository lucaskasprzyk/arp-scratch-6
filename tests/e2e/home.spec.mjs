import { test, expect } from '@playwright/test';

// The first e2e path: opens the page served from ./seed and asserts the seed content on it.
test('the seed page opens and shows its seed content', async ({ page }) => {
  await page.goto('/');
  await expect(page).toHaveTitle('Seed page');
  await expect(page.getByRole('heading', { name: 'Seed data' })).toBeVisible();
  await expect(page.getByText('This page is served from tests/e2e/seed.')).toBeVisible();
});
