# Changelog

All notable changes to this project are documented in this file.

## Unreleased

### Bug fixes

- **bench**: Keep resolver drop cost out of resolution timings ([f8e2929](https://github.com/kristoferssolo/mekle/commit/f8e2929c52e74fcc90d588fe6a5157718693cf07))
- **cli**: Honor RUST_LOG and apply --verbose to add and pin ([5d430d7](https://github.com/kristoferssolo/mekle/commit/5d430d7e90147afa1ec5ec1d3b7248a86ec03c5c))
- **cli**: Read history before scanning projects ([426e8e3](https://github.com/kristoferssolo/mekle/commit/426e8e368bd1a8507fd38876037eb5361af8d2ea))
- **cli**: Keep each project action's error precedence ([ccfc8a8](https://github.com/kristoferssolo/mekle/commit/ccfc8a857474634d206197bf16dc14958d27b63b))
- **cli**: Reload history after the directory scan ([0bcc6e0](https://github.com/kristoferssolo/mekle/commit/0bcc6e0eb59d0183423c7456ed8dec219f95ee8a))
- **cli**: Log the project resolved by add, pin and unpin ([14cda72](https://github.com/kristoferssolo/mekle/commit/14cda72bd9478091dad609d02b2d69819119c1ee))

### Refactoring

- **finder**: Import is_covered and Error through crate paths ([f269a15](https://github.com/kristoferssolo/mekle/commit/f269a1545b0b18571fcdea1969c029e9e99583c4))
- **fs**: Share the read helper between read and read_text ([671588f](https://github.com/kristoferssolo/mekle/commit/671588f86b684b68c7982012dad13e39b5e92615))
- **finder**: Construct RootResolver only from config ([58e75a6](https://github.com/kristoferssolo/mekle/commit/58e75a6acd55518106cbd98e860cbecc447fc479))
- **paths**: Share absolute path resolution ([ac58b99](https://github.com/kristoferssolo/mekle/commit/ac58b991f6dd3bfa5ff935226abf97b3b183b489))
- **history**: Return option from position lookup ([0b2b429](https://github.com/kristoferssolo/mekle/commit/0b2b429a8d5c9f05f5f58f3d9b02eb60a2614abb))
- **output**: Share time constants with history ([22dbd11](https://github.com/kristoferssolo/mekle/commit/22dbd1128212f458154b17f84da3ebf7330b558c))
- **config**: Merge add, pin and unpin into one project invocation ([fc8c49b](https://github.com/kristoferssolo/mekle/commit/fc8c49b70c137eace985506fd142f39d8582650f))
- **config**: Expand tilde in path arguments with a value parser ([5aa3a8e](https://github.com/kristoferssolo/mekle/commit/5aa3a8e2e07499964278c6af2e1bc0b9dbcd2041))
- **config**: Drop redundant serde default on max_results ([56cdcd4](https://github.com/kristoferssolo/mekle/commit/56cdcd4f851442bde310b6c117a556b6c50c6382))

### Documentation

- **paths**: Document absolute failure cases ([132cd25](https://github.com/kristoferssolo/mekle/commit/132cd25b1303f5ddcd9afc2230d41566f68bdc7f))
- **bench**: Drop stale fd requirement ([0345a7f](https://github.com/kristoferssolo/mekle/commit/0345a7fe497af1de9f6c2943086d5b23c43d4df4))

### Testing

- **shell**: Drop assertion guarding a removed feature ([84132ce](https://github.com/kristoferssolo/mekle/commit/84132ce1d4b1f769079100b16e8ec3bf703f7db5))
- Gate unix-only integration tests ([4fb1581](https://github.com/kristoferssolo/mekle/commit/4fb15811202f45f7e90692da6c99f6165a92ab37))
- Assert empty collections by value ([23e5976](https://github.com/kristoferssolo/mekle/commit/23e5976f32c897014f792bead6948a897f578a5a))
- **history**: Cover unknown-entry updates and score replacement ([258c0cf](https://github.com/kristoferssolo/mekle/commit/258c0cf0677028b57f747173afba97fbfc2f735f))
- **cli**: Isolate RUST_LOG from the caller environment ([2d305d3](https://github.com/kristoferssolo/mekle/commit/2d305d362c5e1ca472e0c942d6b451ace4f6750c))

### Build

- Pin development tools with mise ([#13](https://github.com/kristoferssolo/mekle/pull/13)) ([62f78b7](https://github.com/kristoferssolo/mekle/commit/62f78b767e74a9cc13c10101e825cf990b7426d0))

### CI

- **ci**: Declare and check minimum supported rust version ([26d6560](https://github.com/kristoferssolo/mekle/commit/26d6560fb72400ec806c2216c6359d87edab44d8))

### Miscellaneous

- Exclude aur, docs and clippy config from the package ([86e43eb](https://github.com/kristoferssolo/mekle/commit/86e43eb912ac62b15549aefca8aea725bdf242d0))

## [0.2.0](https://github.com/kristoferssolo/mekle/releases/tag/v0.2.0) - 2026-09-28

### Features

- Publish packages to the AUR ([1f6e4dc](https://github.com/kristoferssolo/mekle/commit/1f6e4dcd4db9a92b0f96d25444d95382d141aaf7))

### Bug fixes

- **history**: Match projects by normalized filesystem identity ([8758e63](https://github.com/kristoferssolo/mekle/commit/8758e633981c32f7b716dca7c4f77ae02a43b663))
- **history**: Serialize concurrent history updates ([d23ef21](https://github.com/kristoferssolo/mekle/commit/d23ef217471c48590824ba583c3573af96f49331))
- **fs**: Ignore non-regular paths in content tests ([06396db](https://github.com/kristoferssolo/mekle/commit/06396db265ee671a68cd0ffd69791de8c2f1c6a8))
- **finder**: Preserve relative paths when resolving roots ([03f929b](https://github.com/kristoferssolo/mekle/commit/03f929b276d3f3edb7af4fe4b3ccc166199c5961))
- **finder**: Preserve Git repository roots ([3edb94b](https://github.com/kristoferssolo/mekle/commit/3edb94bb74ed7311c6b8da71f0895ab3f95ec5fc))
- **finder**: Cache Cargo workspace root checks ([8cb9851](https://github.com/kristoferssolo/mekle/commit/8cb98511a0e4b6755b43cc8c927fc495031c5770))
- **finder**: Resolve project roots from absolute paths ([3d5c12a](https://github.com/kristoferssolo/mekle/commit/3d5c12a47de3255748645975d0f24dde4ffa502f))

### Refactoring

- **finder**: Isolate identity merging ([745f06a](https://github.com/kristoferssolo/mekle/commit/745f06a91b42e46d7907c74f2751dc3682c2c22c))

### Documentation

- Refresh README with branding and usage guidance ([fa8ef30](https://github.com/kristoferssolo/mekle/commit/fa8ef30acb97d7d35f7a45bd2948672eaa2bf89f))

### Testing

- **cli**: Preserve relative project paths during search ([17d84a0](https://github.com/kristoferssolo/mekle/commit/17d84a041d0ffc52a57fa765ec777af2c9211e48))

### Miscellaneous

- Update dependency versions ([63f344d](https://github.com/kristoferssolo/mekle/commit/63f344d30264acf99fc8f1d56755bb12b23acf18))
- Update justfile ([2244407](https://github.com/kristoferssolo/mekle/commit/224440750ac34ae7cd49130a2146712868bf6225))
- Bump version number ([25a4c52](https://github.com/kristoferssolo/mekle/commit/25a4c523ba34c0f2dbf3d7f98ed5928233a7bcc1))

## [0.1.0](https://github.com/kristoferssolo/mekle/releases/tag/v0.1.0) - 2026-08-29

### Features

- Implement main functionality ([73e1b44](https://github.com/kristoferssolo/mekle/commit/73e1b443122037b9d2195e332eddc072356c4153))
- Improve execution speed ([859bd11](https://github.com/kristoferssolo/mekle/commit/859bd1135e8f06ac6f45316ac5853db475b02eb0))
- **snapshot**: Add filesystem snapshot creator ([bee7bd2](https://github.com/kristoferssolo/mekle/commit/bee7bd20977121c18e9523b715492841c8e8734b))
- **config**: Load project discovery settings from XDG config ([3ec4e61](https://github.com/kristoferssolo/mekle/commit/3ec4e61b30ef1186c2446fd2461a2923bc21858e))
- **scan**: Follow symlinked directories while searching ([2404875](https://github.com/kristoferssolo/mekle/commit/24048750c880c8c3bd20a1115ead12646d4fac4f))
- **output**: Shorten printed paths under home to ~ ([a254b6a](https://github.com/kristoferssolo/mekle/commit/a254b6a3f05138eef32508655ce54685c452e0e0))
- **history**: Track project frecency ([a94af78](https://github.com/kristoferssolo/mekle/commit/a94af786fae29ebc2cd5be7ec69751fe1714fb62))
- **cli**: Rank projects by visit history ([77a0467](https://github.com/kristoferssolo/mekle/commit/77a046784c930de8e07ff19889ea6dc8999bc5f9))
- **history**: Manage project scores ([5bf2170](https://github.com/kristoferssolo/mekle/commit/5bf21700d60ce91feae2a72b7b131bdc8c22360e))
- **cli**: Generate shell completions ([e1dde83](https://github.com/kristoferssolo/mekle/commit/e1dde83356264bf11330cd0e8a00bf945b70b233))
- **shell**: Add fzf project picker integration ([e02d2d4](https://github.com/kristoferssolo/mekle/commit/e02d2d477fc010d24e212f73ed81a2f49f279dba))
- **cli**: Add JSON and NUL project output formats ([3b60148](https://github.com/kristoferssolo/mekle/commit/3b6014814f372d5bbf3178da0015d79a323eb303))
- **history**: Prune projects with missing paths ([e694de5](https://github.com/kristoferssolo/mekle/commit/e694de51ec9e4df245b5ebb133b0e3d95f5af065))
- **scan**: Support explicit exclusion patterns ([2fcae38](https://github.com/kristoferssolo/mekle/commit/2fcae38e719eafca62aa42e83944f8126a7332f1))
- **scan**: Discover Git worktrees ([26f1f6a](https://github.com/kristoferssolo/mekle/commit/26f1f6aad3570c33b3be249310af2191d2baa6f1))
- **history**: Pin projects above the frecency ranking ([4ab02bf](https://github.com/kristoferssolo/mekle/commit/4ab02bffab3ca9bcc1a276b31b0d0fd3ce396178))
- List pinned projects the search did not find ([71d8050](https://github.com/kristoferssolo/mekle/commit/71d80500605522bc8ff6c1a2fc6ad4bd999bfee6))

### Bug fixes

- Remove clippy warnings ([1683728](https://github.com/kristoferssolo/mekle/commit/1683728031be7aa16b7223d175a6ff3396816a01))
- Add 'fdfind' binary name ([7256de3](https://github.com/kristoferssolo/mekle/commit/7256de34acbd0490fb1f06afbf4d7e5c1af93164))
- **commands**: Match workspace manifests anywhere in the file ([4732164](https://github.com/kristoferssolo/mekle/commit/47321643edf4500d19426469c3a3f708aeeecf79))
- **bench**: Silence fixture setup during benchmark discovery ([3145e95](https://github.com/kristoferssolo/mekle/commit/3145e95a21fbb12dee82f700d368e998364bdbc5))
- **config**: Expand a leading tilde in search paths ([ddda747](https://github.com/kristoferssolo/mekle/commit/ddda7476bf5bac71140ca6e12d41972fd0f86af6))
- **completions**: Hide paths before subcommands ([a11e688](https://github.com/kristoferssolo/mekle/commit/a11e688bafcb76fd0d25fc55990230d46c1137ca))
- **cli**: Resolve added directories to project roots ([681dccd](https://github.com/kristoferssolo/mekle/commit/681dccdda8bed9c1c741e4b9ca08e22618566fec))
- **finder**: Apply max_results only after ranking ([30ea0c1](https://github.com/kristoferssolo/mekle/commit/30ea0c188b09952a7122800189c635df761826c8))
- **paths**: Normalize missing path components ([295eb8e](https://github.com/kristoferssolo/mekle/commit/295eb8e006540ef58b8d9e0e00ec6f6bf2205d7a))

### Performance

- Scan repositories and markers concurrently ([e061d23](https://github.com/kristoferssolo/mekle/commit/e061d235cd0be1a772817632b9a7987ef87114b1))
- Scan once and resolve project roots without quadratic rescans ([b1a49fe](https://github.com/kristoferssolo/mekle/commit/b1a49fe64d2e6771ec5da1c0688ee109bd375eee))
- Expand benchmark coverage across mekle workflows ([ed89bd9](https://github.com/kristoferssolo/mekle/commit/ed89bd9eaaac4cbf946a07cb936d773a23a8e319))

### Refactoring

- Mitigate some issues ([724e0ff](https://github.com/kristoferssolo/mekle/commit/724e0fffd3a910f252d68b43b6cf941f119a5b49))
- Separate main function ([f157272](https://github.com/kristoferssolo/mekle/commit/f15727203dfdf4ac58aee449400753226f42900d))
- Benchmarks ([1a0f34c](https://github.com/kristoferssolo/mekle/commit/1a0f34c996a2a963281fa5314e389e7b8d01a2fd))
- Use anyhow::Result ([620c274](https://github.com/kristoferssolo/mekle/commit/620c274e546e03871325edcec22b808003dfee19))
- Impl Display and Default ([c1e568a](https://github.com/kristoferssolo/mekle/commit/c1e568aa3fd7cdb7a8562bd4b8c517fe0062cb69))
- **marker**: Replace infallible FromStr with From<&str> ([1606ef5](https://github.com/kristoferssolo/mekle/commit/1606ef5592b2536ef17edc509c999459a09b78eb))
- **dependencies**: Store fd path as PathBuf ([62f3d33](https://github.com/kristoferssolo/mekle/commit/62f3d33fe58dca5be74fa13bf039609a3196c760))
- **errors**: Give every failure a typed variant ([2064722](https://github.com/kristoferssolo/mekle/commit/20647227f72c7637202d8e6dfc5bb513f638debd))
- **finder**: Collapse four copies of the root ascent into one ([1fb93bc](https://github.com/kristoferssolo/mekle/commit/1fb93bc71cf47fcfa8ec62463b61c66f34f3571a))
- **finder**: Express nested-project detection as a predicate ([9f45abb](https://github.com/kristoferssolo/mekle/commit/9f45abb0df3981a094d0e865cec8b0359482fc7f))
- **config**: [**breaking**] Model an unlimited result count as None ([678f885](https://github.com/kristoferssolo/mekle/commit/678f885a2176a2cd611fb00cf43dd94c4c7da462))
- **main**: Report the full error chain with color-eyre ([346b794](https://github.com/kristoferssolo/mekle/commit/346b794d46f0411fa5992b34dda8b9a8cbace182))
- Use color-eyre in benchmarks and tests ([faa472b](https://github.com/kristoferssolo/mekle/commit/faa472b6843ac6b67fbbeac8c93ecd8c8d1c4fb6))
- Trim redundant code comments ([3b538bb](https://github.com/kristoferssolo/mekle/commit/3b538bbc6d19fd9b0f3ca58055d80448959d9a47))
- Separate scanning from root resolution ([7e6f871](https://github.com/kristoferssolo/mekle/commit/7e6f871e854babfa36ea2cf6e8d501282783f4e4))
- Load built-in defaults from TOML ([af33318](https://github.com/kristoferssolo/mekle/commit/af333189fda23506cc2a15b42d139e40e9f5718c))
- Rename project-finder to projfind ([8082950](https://github.com/kristoferssolo/mekle/commit/80829505c1a7f28f35e213578cca9356d9f8bdf6))
- Rename project to mekle ([3212115](https://github.com/kristoferssolo/mekle/commit/3212115b4285aea24ab1d69a7f0872d8b16c1ab5))
- **scan**: Replace fd dependency with ignore walker ([6f9222a](https://github.com/kristoferssolo/mekle/commit/6f9222ab3a42a1fe9caa0f21b1763c7e74646c74))
- **scan**: Split traversal from exclusion matching ([331fc00](https://github.com/kristoferssolo/mekle/commit/331fc00ec4908ed034ab497ebf695a40a7cc8586))
- **error**: Rename ProjectFinderError to Error ([9607c26](https://github.com/kristoferssolo/mekle/commit/9607c26a012948b64c005f3ea23bff368841ef65))
- **fs**: Centralize file access behind a dedicated module ([64257b5](https://github.com/kristoferssolo/mekle/commit/64257b5cf9ef29ef80bdb0c097403fb62856ac4a))
- **paths**: Share the XDG lookup between config and history ([6bde6f5](https://github.com/kristoferssolo/mekle/commit/6bde6f5d2cdd412c6037120f4ebaf2c189dba8a4))
- **scan**: Group the walk state into a visitor ([49caad6](https://github.com/kristoferssolo/mekle/commit/49caad62c0d880f26f68af52932a87b82a7f086a))
- **finder**: Collapse the parallel project set and map ([deac90d](https://github.com/kristoferssolo/mekle/commit/deac90df2dfe14dc74c9be5f3c9507c3819d5934))
- **history**: Drop dead sorting and stop cloning on every write ([1b07f5f](https://github.com/kristoferssolo/mekle/commit/1b07f5f77153e412902d0f39b84707fc8f91000a))
- **config**: Split search arguments from the subcommand ([417070a](https://github.com/kristoferssolo/mekle/commit/417070aad250e167c4952439b655b5057b30e978))

### Documentation

- Add readme ([4711a77](https://github.com/kristoferssolo/mekle/commit/4711a77f7bc4952e5a41ea2a7de6d8e3ce7f9110))
- Add docstrings ([5647d63](https://github.com/kristoferssolo/mekle/commit/5647d63978e380c85c749036830aa6afe2f7b7a6))
- **readme**: Document root resolution and the dev workflow ([ed9cd09](https://github.com/kristoferssolo/mekle/commit/ed9cd09229808e2cbd94f57d6bd7faf539f5ce15))
- Tighten README ([1dcb64d](https://github.com/kristoferssolo/mekle/commit/1dcb64db9340cdd932ac698f9c2653f0b4595ac8))
- **config**: Explain marker groups and workspace files ([fc86ef7](https://github.com/kristoferssolo/mekle/commit/fc86ef71c57b550cf90ccf8a119871dff87f5c24))
- Add changelog ([ed6e74e](https://github.com/kristoferssolo/mekle/commit/ed6e74ead1e3dbfbee6ba8ec0e846ccf044b4ebf))
- **readme**: Explain project ranking ([75e7870](https://github.com/kristoferssolo/mekle/commit/75e7870cbb83ceaf286e9ad843d7abfe996cbf44))
- **readme**: Document history management ([56d1b4f](https://github.com/kristoferssolo/mekle/commit/56d1b4f6ab3e854d3d0d6f56beca0d9a3c0159c2))
- Describe what each module is responsible for ([4dbf9cb](https://github.com/kristoferssolo/mekle/commit/4dbf9cb0ed9b01d5b588c08be385582cbcddfc8f))

### Testing

- **bench**: Add basic benchmark ([385a4bf](https://github.com/kristoferssolo/mekle/commit/385a4bf20e6e7763d9b7d6e2dacc8ea5c8514ac9))
- Replace the placeholder test with end-to-end coverage ([802be71](https://github.com/kristoferssolo/mekle/commit/802be7183a411d48af3a31764b47134e836b396c))
- Expand discovery coverage and benchmarks ([51be9a7](https://github.com/kristoferssolo/mekle/commit/51be9a7dbc915dec66f9835311e3c59337b1bf1b))
- Use valid git repository fixtures ([45f6a6f](https://github.com/kristoferssolo/mekle/commit/45f6a6f07d894ec3b8447e51ab651f70ad8afd98))

### CI

- Add initial CI/CD ([d2cce4b](https://github.com/kristoferssolo/mekle/commit/d2cce4b6c0a5e4c0a9a7c7b6b839bf949b201b6f))
- Fix errors ([956ea4e](https://github.com/kristoferssolo/mekle/commit/956ea4e4106e4d6ee5559adb80ecd4eda8fb6e4c))
- Add fixture example ([0cf677d](https://github.com/kristoferssolo/mekle/commit/0cf677d5cb171aa299ee7921bd721623b399ada7))
- Install fd-find ([bce3c6b](https://github.com/kristoferssolo/mekle/commit/bce3c6bdbaedf2f535ddef348db731dff4596392))
- Modernize validation and release workflows ([155c68c](https://github.com/kristoferssolo/mekle/commit/155c68c755d2297ebf126a30bd343bc1d56b78b9))
- Run tests with nextest ([0ad00e0](https://github.com/kristoferssolo/mekle/commit/0ad00e0163ddfe4ac65e1e173b90dfe746933e54))
- Audit dependencies ([aa78c66](https://github.com/kristoferssolo/mekle/commit/aa78c66228dcdbb91e2280dc8d537ce14ab8d5df))
- Use audit action in continuous integration ([5402203](https://github.com/kristoferssolo/mekle/commit/5402203e6e8c41fffab546173a5371190f898c75))
- Improve Rust build speed ([81ebf4b](https://github.com/kristoferssolo/mekle/commit/81ebf4b1249640cbc22321008a4facd85f5daf6e))

### Miscellaneous

- **benches**: Clear the outstanding clippy warnings ([5eeb356](https://github.com/kristoferssolo/mekle/commit/5eeb356375d5fce5bdd4da307b1bd2e2ca0f19c4))
- **deps**: Update dependencies and raise minimum versions ([81f208b](https://github.com/kristoferssolo/mekle/commit/81f208b29aa6ef084fb8f5e16a1a7a088c2e572a))
- **justfile**: Add recipes for the everyday tasks ([bbedb34](https://github.com/kristoferssolo/mekle/commit/bbedb34b928c45fb3f0148baf6094aab980f10b3))
- **justfile**: Add single-letter aliases ([ead4864](https://github.com/kristoferssolo/mekle/commit/ead4864be4c760dbb8020cfc0703e64978a86ce0))
- Bump version number ([6de4540](https://github.com/kristoferssolo/mekle/commit/6de454061c4b17d8a2c718c0682e65c34fbbd48e))
- Streamline project documentation and tooling ([ce482d4](https://github.com/kristoferssolo/mekle/commit/ce482d4c5af7cb4cbe6d2b1f5f76c65adc43ec94))
- Bump version to 0.3.0 ([2302d6f](https://github.com/kristoferssolo/mekle/commit/2302d6f54a7512c599440b5fcd4628d9e8833576))

<!-- generated by git-cliff -->
