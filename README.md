# jest-examples

Small collection of Jest test fixtures used for teaching. Open in VS Code with
the **Jest Runner** extension installed and click **Run** above any test to try
it out.

## Layout

```
pkgs/
└── <fixture-dir>/
    ├── package.json
    └── sample.test.js
```

> If `npm i` complains about the package name, that's fine — the fixture is
> meant to be run via the Jest Runner code lens, not via `npm test`.
