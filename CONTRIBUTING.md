# Contributing

Thanks for contributing to this repository.

## Scope

This project contains algorithm and data structure implementations in D.
Keep contributions focused, small, and easy to review.

## Before You Start

- Check whether a similar implementation already exists.
- Prefer improving an existing file over adding a duplicate algorithm.
- Keep the repository beginner-friendly: clear code is better than clever code.

## File Layout

Place new code under `src/` in the most relevant category:

- `src/sort/`
- `src/search/`
- `src/math/`
- `src/data_structures/`
- `src/dynamic_programming/`
- `src/problems/`
- `src/compilers/`

If you add a new category, keep the folder name descriptive and consistent with the rest of the tree.

## Coding Style

- Write D code that is readable and straightforward.
- Prefer small helper functions when it makes the algorithm easier to test.
- Keep imports minimal.
- Use ASCII unless the file already uses other characters.
- Match the existing formatting style of the file you are editing.

## Tests

Every implementation should include `unittest` coverage in the same file.

- Add tests for normal cases.
- Add tests for edge cases when they matter.
- Keep unit tests deterministic and self-contained.
- Do not rely on external input, files, or network access in tests.

If the file is meant to be an executable example, it should still include `unittest` blocks when possible.

## `main` Functions

Most algorithm files in this repository keep an empty `main()` and put validation in `unittest`.
Follow the existing pattern in the file you are touching.

Only keep a non-empty `main()` when the file is intentionally a CLI tool or demo program.

## Submitting Changes

- Keep the change focused on one algorithm or one logical improvement.
- Include tests in the same change.
- Avoid unrelated refactors.
- Update documentation only when the behavior or structure changes.

## Review Checklist

Before opening a pull request, make sure:

- the code compiles
- unit tests pass
- the file is placed in the correct folder
- the implementation matches the style of the surrounding code

