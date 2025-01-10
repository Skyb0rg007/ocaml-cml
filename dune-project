(lang dune 3.17)

(name cml)

(generate_opam_files true)

(source
 (github Skyb0rg007/ocaml-cml))

(authors "Skye Soss <skyler.soss@gmail.com>")

(maintainers "Skye Soss <skyler.soss@gmail.com>")

(license LICENSE)

(documentation https://github.com/Skyb0rg007/ocaml-cml)

(package
 (name cml)
 (synopsis "Concurrent ML in OCaml")
 (description "A modern implementation of CML using new OCaml features")
 (depends ocaml)
 (tags
  (concurrency)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
