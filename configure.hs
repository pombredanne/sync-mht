#!/usr/bin/env runhaskell
import Configure.Helper
import System.FilePath

main :: IO ()
main =
    do let name = "sync-mht"
       gitHubDescription <- gitHubProject $ "https://github.com/ekarayel/" ++ name
       writeFile (name <.> "cabal") $ unlines $
           [ "-- This .cabal file was generated by configure.hs"
           , "name: " ++ name
           ] ++ mitLicense
           ++ authorAndMaintainer "Emin Karayel <me@eminkarayel.de>" ++
           [ "category: Utility"
           , "extra-doc-files: " ++ "README.md"
           , "cabal-version: >=1.10"
           , "build-type: Simple"
           ] ++ gitHubDescription ++
           [ "executable sync-mht"
           , "    main-is: Main.hs"
           , "    other-modules:"
           , "        Sync.MerkleTree.Analyse"
           , "        Sync.MerkleTree.Client"
           , "        Sync.MerkleTree.CommTypes"
           , "        Sync.MerkleTree.Server"
           , "        Sync.MerkleTree.Sync"
           , "        Sync.MerkleTree.Trie"
           , "        Sync.MerkleTree.Types"
           , "        Sync.MerkleTree.Util.RequestMonad"
           , "    ghc-options: -Wall"
           , "    build-depends: "
           , "        base >=4.7 && <4.8"
           , "        , unix >=2.7 && <2.8"
           , "        , directory >=1.2 && <1.3"
           , "        , filepath >=1.3 && <1.4"
           , "        , process >=1.2 &&  <1.3"
           , "        , cryptohash >=0.11 && <0.12"
           , "        , byteable >=0.1 && <0.2"
           , "        , array >=0.5 && <0.6"
           , "        , containers >=0.5 && <0.6"
           , "        , text >=1.2 && <1.3"
           , "        , bytestring >=0.10 && <0.11"
           , "        , base16-bytestring >=0.1 && <0.2"
           , "        , cereal >= 0.4 && < 0.5"
           , "        , io-streams >= 1.2 && <1.3"
           , "        , transformers >= 0.4 && < 0.5"
           , "        , regex-compat-tdfa >= 0.95 && < 0.96"
           , "        , mtl >= 2.2 && < 2.3"
           , "    hs-source-dirs: src/main/hs"
           , "    default-language: Haskell2010"
           ]