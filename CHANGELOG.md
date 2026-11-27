# Changelog

## Unreleased

### Bug fixes

- **bench:** Keep resolver drop cost out of resolution timings ([f8e2929](https://github.com/kristoferssolo/mekle/commit/f8e2929c52e74fcc90d588fe6a5157718693cf07))
- **cli:** Honor RUST_LOG and apply --verbose to add and pin ([5d430d7](https://github.com/kristoferssolo/mekle/commit/5d430d7e90147afa1ec5ec1d3b7248a86ec03c5c))
- **cli:** Read history before scanning projects ([426e8e3](https://github.com/kristoferssolo/mekle/commit/426e8e368bd1a8507fd38876037eb5361af8d2ea))
- **cli:** Keep each project action's error precedence ([ccfc8a8](https://github.com/kristoferssolo/mekle/commit/ccfc8a857474634d206197bf16dc14958d27b63b))
- **cli:** Reload history after the directory scan ([0bcc6e0](https://github.com/kristoferssolo/mekle/commit/0bcc6e0eb59d0183423c7456ed8dec219f95ee8a))
- **cli:** Log the project resolved by add, pin and unpin ([14cda72](https://github.com/kristoferssolo/mekle/commit/14cda72bd9478091dad609d02b2d69819119c1ee))

### Refactoring

- **finder:** Import is_covered and Error through crate paths ([f269a15](https://github.com/kristoferssolo/mekle/commit/f269a1545b0b18571fcdea1969c029e9e99583c4))
- **fs:** Share the read helper between read and read_text ([671588f](https://github.com/kristoferssolo/mekle/commit/671588f86b684b68c7982012dad13e39b5e92615))
- **finder:** Construct RootResolver only from config ([58e75a6](https://github.com/kristoferssolo/mekle/commit/58e75a6acd55518106cbd98e860cbecc447fc479))
- **paths:** Share absolute path resolution ([ac58b99](https://github.com/kristoferssolo/mekle/commit/ac58b991f6dd3bfa5ff935226abf97b3b183b489))
- **history:** Return option from position lookup ([0b2b429](https://github.com/kristoferssolo/mekle/commit/0b2b429a8d5c9f05f5f58f3d9b02eb60a2614abb))
- **output:** Share time constants with history ([22dbd11](https://github.com/kristoferssolo/mekle/commit/22dbd1128212f458154b17f84da3ebf7330b558c))
- **config:** Merge add, pin and unpin into one project invocation ([fc8c49b](https://github.com/kristoferssolo/mekle/commit/fc8c49b70c137eace985506fd142f39d8582650f))
- **config:** Expand tilde in path arguments with a value parser ([5aa3a8e](https://github.com/kristoferssolo/mekle/commit/5aa3a8e2e07499964278c6af2e1bc0b9dbcd2041))
- **config:** Drop redundant serde default on max_results ([56cdcd4](https://github.com/kristoferssolo/mekle/commit/56cdcd4f851442bde310b6c117a556b6c50c6382))

### Documentation

- **paths:** Document absolute failure cases ([132cd25](https://github.com/kristoferssolo/mekle/commit/132cd25b1303f5ddcd9afc2230d41566f68bdc7f))
- **bench:** Drop stale fd requirement ([0345a7f](https://github.com/kristoferssolo/mekle/commit/0345a7fe497af1de9f6c2943086d5b23c43d4df4))

**Full changelog:** https://github.com/kristoferssolo/mekle/compare/v0.2.0...HEAD

## [0.2.0](https://github.com/kristoferssolo/mekle/releases/tag/v0.2.0) - 2026-09-28

### Features

- Publish packages to the AUR ([1f6e4dc](https://github.com/kristoferssolo/mekle/commit/1f6e4dcd4db9a92b0f96d25444d95382d141aaf7))

### Bug fixes

- **history:** Match projects by normalized filesystem identity ([8758e63](https://github.com/kristoferssolo/mekle/commit/8758e633981c32f7b716dca7c4f77ae02a43b663))
- **history:** Serialize concurrent history updates ([d23ef21](https://github.com/kristoferssolo/mekle/commit/d23ef217471c48590824ba583c3573af96f49331))
- **fs:** Ignore non-regular paths in content tests ([06396db](https://github.com/kristoferssolo/mekle/commit/06396db265ee671a68cd0ffd69791de8c2f1c6a8))
- **finder:** Preserve relative paths when resolving roots ([03f929b](https://github.com/kristoferssolo/mekle/commit/03f929b276d3f3edb7af4fe4b3ccc166199c5961))
- **finder:** Preserve Git repository roots ([3edb94b](https://github.com/kristoferssolo/mekle/commit/3edb94bb74ed7311c6b8da71f0895ab3f95ec5fc))
- **finder:** Cache Cargo workspace root checks ([8cb9851](https://github.com/kristoferssolo/mekle/commit/8cb98511a0e4b6755b43cc8c927fc495031c5770))
- **finder:** Resolve project roots from absolute paths ([3d5c12a](https://github.com/kristoferssolo/mekle/commit/3d5c12a47de3255748645975d0f24dde4ffa502f))

### Refactoring

- **finder:** Isolate identity merging ([745f06a](https://github.com/kristoferssolo/mekle/commit/745f06a91b42e46d7907c74f2751dc3682c2c22c))

### Documentation

- Refresh README with branding and usage guidance ([fa8ef30](https://github.com/kristoferssolo/mekle/commit/fa8ef30acb97d7d35f7a45bd2948672eaa2bf89f))

**Full changelog:** https://github.com/kristoferssolo/mekle/compare/v0.1.0...v0.2.0

## [0.1.0](https://github.com/kristoferssolo/mekle/releases/tag/v0.1.0) - 2026-08-29

### Breaking changes

- **config:** Model an unlimited result count as None ([678f885](https://github.com/kristoferssolo/mekle/commit/678f885a2176a2cd611fb00cf43dd94c4c7da462))

### Features

- Implement main functionality ([73e1b44](https://github.com/kristoferssolo/mekle/commit/73e1b443122037b9d2195e332eddc072356c4153))
- Improve execution speed ([859bd11](https://github.com/kristoferssolo/mekle/commit/859bd1135e8f06ac6f45316ac5853db475b02eb0))
- **snapshot:** Add filesystem snapshot creator ([bee7bd2](https://github.com/kristoferssolo/mekle/commit/bee7bd20977121c18e9523b715492841c8e8734b))
- **config:** Load project discovery settings from XDG config ([3ec4e61](https://github.com/kristoferssolo/mekle/commit/3ec4e61b30ef1186c2446fd2461a2923bc21858e))
- **scan:** Follow symlinked directories while searching ([2404875](https://github.com/kristoferssolo/mekle/commit/24048750c880c8c3bd20a1115ead12646d4fac4f))
- **output:** Shorten printed paths under home to ~ ([a254b6a](https://github.com/kristoferssolo/mekle/commit/a254b6a3f05138eef32508655ce54685c452e0e0))
- **history:** Track project frecency ([a94af78](https://github.com/kristoferssolo/mekle/commit/a94af786fae29ebc2cd5be7ec69751fe1714fb62))
- **cli:** Rank projects by visit history ([77a0467](https://github.com/kristoferssolo/mekle/commit/77a046784c930de8e07ff19889ea6dc8999bc5f9))
- **history:** Manage project scores ([5bf2170](https://github.com/kristoferssolo/mekle/commit/5bf21700d60ce91feae2a72b7b131bdc8c22360e))
- **cli:** Generate shell completions ([e1dde83](https://github.com/kristoferssolo/mekle/commit/e1dde83356264bf11330cd0e8a00bf945b70b233))
- **shell:** Add fzf project picker integration ([e02d2d4](https://github.com/kristoferssolo/mekle/commit/e02d2d477fc010d24e212f73ed81a2f49f279dba))
- **cli:** Add JSON and NUL project output formats ([3b60148](https://github.com/kristoferssolo/mekle/commit/3b6014814f372d5bbf3178da0015d79a323eb303))
- **history:** Prune projects with missing paths ([e694de5](https://github.com/kristoferssolo/mekle/commit/e694de51ec9e4df245b5ebb133b0e3d95f5af065))
- **scan:** Support explicit exclusion patterns ([2fcae38](https://github.com/kristoferssolo/mekle/commit/2fcae38e719eafca62aa42e83944f8126a7332f1))
- **scan:** Discover Git worktrees ([26f1f6a](https://github.com/kristoferssolo/mekle/commit/26f1f6aad3570c33b3be249310af2191d2baa6f1))
- **history:** Pin projects above the frecency ranking ([4ab02bf](https://github.com/kristoferssolo/mekle/commit/4ab02bffab3ca9bcc1a276b31b0d0fd3ce396178))
- List pinned projects the search did not find ([71d8050](https://github.com/kristoferssolo/mekle/commit/71d80500605522bc8ff6c1a2fc6ad4bd999bfee6))

### Bug fixes

- Remove clippy warnings ([1683728](https://github.com/kristoferssolo/mekle/commit/1683728031be7aa16b7223d175a6ff3396816a01))
- Add 'fdfind' binary name ([7256de3](https://github.com/kristoferssolo/mekle/commit/7256de34acbd0490fb1f06afbf4d7e5c1af93164))
- **commands:** Match workspace manifests anywhere in the file ([4732164](https://github.com/kristoferssolo/mekle/commit/47321643edf4500d19426469c3a3f708aeeecf79))
- **bench:** Silence fixture setup during benchmark discovery ([3145e95](https://github.com/kristoferssolo/mekle/commit/3145e95a21fbb12dee82f700d368e998364bdbc5))
- **config:** Expand a leading tilde in search paths ([ddda747](https://github.com/kristoferssolo/mekle/commit/ddda7476bf5bac71140ca6e12d41972fd0f86af6))
- **completions:** Hide paths before subcommands ([a11e688](https://github.com/kristoferssolo/mekle/commit/a11e688bafcb76fd0d25fc55990230d46c1137ca))
- **cli:** Resolve added directories to project roots ([681dccd](https://github.com/kristoferssolo/mekle/commit/681dccdda8bed9c1c741e4b9ca08e22618566fec))
- **finder:** Apply max_results only after ranking ([30ea0c1](https://github.com/kristoferssolo/mekle/commit/30ea0c188b09952a7122800189c635df761826c8))
- **paths:** Normalize missing path components ([295eb8e](https://github.com/kristoferssolo/mekle/commit/295eb8e006540ef58b8d9e0e00ec6f6bf2205d7a))

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
- **marker:** Replace infallible FromStr with From<&str> ([1606ef5](https://github.com/kristoferssolo/mekle/commit/1606ef5592b2536ef17edc509c999459a09b78eb))
- **dependencies:** Store fd path as PathBuf ([62f3d33](https://github.com/kristoferssolo/mekle/commit/62f3d33fe58dca5be74fa13bf039609a3196c760))
- **errors:** Give every failure a typed variant ([2064722](https://github.com/kristoferssolo/mekle/commit/20647227f72c7637202d8e6dfc5bb513f638debd))
- **finder:** Collapse four copies of the root ascent into one ([1fb93bc](https://github.com/kristoferssolo/mekle/commit/1fb93bc71cf47fcfa8ec62463b61c66f34f3571a))
- **finder:** Express nested-project detection as a predicate ([9f45abb](https://github.com/kristoferssolo/mekle/commit/9f45abb0df3981a094d0e865cec8b0359482fc7f))
- **main:** Report the full error chain with color-eyre ([346b794](https://github.com/kristoferssolo/mekle/commit/346b794d46f0411fa5992b34dda8b9a8cbace182))
- Use color-eyre in benchmarks and tests ([faa472b](https://github.com/kristoferssolo/mekle/commit/faa472b6843ac6b67fbbeac8c93ecd8c8d1c4fb6))
- Trim redundant code comments ([3b538bb](https://github.com/kristoferssolo/mekle/commit/3b538bbc6d19fd9b0f3ca58055d80448959d9a47))
- Separate scanning from root resolution ([7e6f871](https://github.com/kristoferssolo/mekle/commit/7e6f871e854babfa36ea2cf6e8d501282783f4e4))
- Load built-in defaults from TOML ([af33318](https://github.com/kristoferssolo/mekle/commit/af333189fda23506cc2a15b42d139e40e9f5718c))
- Rename project-finder to projfind ([8082950](https://github.com/kristoferssolo/mekle/commit/80829505c1a7f28f35e213578cca9356d9f8bdf6))
- Rename project to mekle ([3212115](https://github.com/kristoferssolo/mekle/commit/3212115b4285aea24ab1d69a7f0872d8b16c1ab5))
- **scan:** Replace fd dependency with ignore walker ([6f9222a](https://github.com/kristoferssolo/mekle/commit/6f9222ab3a42a1fe9caa0f21b1763c7e74646c74))
- **scan:** Split traversal from exclusion matching ([331fc00](https://github.com/kristoferssolo/mekle/commit/331fc00ec4908ed034ab497ebf695a40a7cc8586))
- **error:** Rename ProjectFinderError to Error ([9607c26](https://github.com/kristoferssolo/mekle/commit/9607c26a012948b64c005f3ea23bff368841ef65))
- **fs:** Centralize file access behind a dedicated module ([64257b5](https://github.com/kristoferssolo/mekle/commit/64257b5cf9ef29ef80bdb0c097403fb62856ac4a))
- **paths:** Share the XDG lookup between config and history ([6bde6f5](https://github.com/kristoferssolo/mekle/commit/6bde6f5d2cdd412c6037120f4ebaf2c189dba8a4))
- **scan:** Group the walk state into a visitor ([49caad6](https://github.com/kristoferssolo/mekle/commit/49caad62c0d880f26f68af52932a87b82a7f086a))
- **finder:** Collapse the parallel project set and map ([deac90d](https://github.com/kristoferssolo/mekle/commit/deac90df2dfe14dc74c9be5f3c9507c3819d5934))
- **history:** Drop dead sorting and stop cloning on every write ([1b07f5f](https://github.com/kristoferssolo/mekle/commit/1b07f5f77153e412902d0f39b84707fc8f91000a))
- **config:** Split search arguments from the subcommand ([417070a](https://github.com/kristoferssolo/mekle/commit/417070aad250e167c4952439b655b5057b30e978))

### Documentation

- Add readme ([4711a77](https://github.com/kristoferssolo/mekle/commit/4711a77f7bc4952e5a41ea2a7de6d8e3ce7f9110))
- Add docstrings ([5647d63](https://github.com/kristoferssolo/mekle/commit/5647d63978e380c85c749036830aa6afe2f7b7a6))
- **readme:** Document root resolution and the dev workflow ([ed9cd09](https://github.com/kristoferssolo/mekle/commit/ed9cd09229808e2cbd94f57d6bd7faf539f5ce15))
- Tighten README ([1dcb64d](https://github.com/kristoferssolo/mekle/commit/1dcb64db9340cdd932ac698f9c2653f0b4595ac8))
- **config:** Explain marker groups and workspace files ([fc86ef7](https://github.com/kristoferssolo/mekle/commit/fc86ef71c57b550cf90ccf8a119871dff87f5c24))
- Add changelog ([ed6e74e](https://github.com/kristoferssolo/mekle/commit/ed6e74ead1e3dbfbee6ba8ec0e846ccf044b4ebf))
- **readme:** Explain project ranking ([75e7870](https://github.com/kristoferssolo/mekle/commit/75e7870cbb83ceaf286e9ad843d7abfe996cbf44))
- **readme:** Document history management ([56d1b4f](https://github.com/kristoferssolo/mekle/commit/56d1b4f6ab3e854d3d0d6f56beca0d9a3c0159c2))
- Describe what each module is responsible for ([4dbf9cb](https://github.com/kristoferssolo/mekle/commit/4dbf9cb0ed9b01d5b588c08be385582cbcddfc8f))

