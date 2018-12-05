import Test.Hspec
import Day1 (frequency1, frequency2)
import Day2 (checksum, offByOne)

main :: IO ()
main = hspec $ do
    describe "Day1" $ do
        describe "Day1.frequency1" $ do
            it "returns 3 for +1, +1, +1" $ do
                frequency1 ["+1", "+1", "+1"] `shouldBe` 3
            it "returns 0 for +1, +1, -2" $ do
                frequency1 ["+1", "+1", "-2"] `shouldBe` 0
            it "returns -6 for -1, -2, -3" $ do
                frequency1 ["-1", "-2", "-3"] `shouldBe` -6
        describe "Day1.frequency2" $ do
            it "returns 0 for +1, -1" $ do
                frequency2 ["+1", "-1"] `shouldBe` 0
            it "returns 10 for +3, +3, +4, -2, -4" $ do
                frequency2 ["+3", "+3", "+4", "-2", "-4"] `shouldBe` 10
            it "returns 5 for -6, +3, +8, +5, -6" $ do
                frequency2 ["-6", "+3", "+8", "+5", "-6"] `shouldBe` 5
            it "returns 14 for +7, +7, -2, -7, -4" $ do
                frequency2 ["+7", "+7", "-2", "-7", "-4"] `shouldBe` 14
    describe "Day2" $ do
        describe "Day2.checksum" $ do
            it "returns 12 for abcdef, bababc, abbcde, abcccd, aabcdd, abcdee, ababab" $ do
                checksum ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"] `shouldBe` 12
        describe "Day2.offByOne" $ do
            it "returns fgij for abcde, fghij, klmno, pqrst, fguij, axcye, wvxyz" $ do
                offByOne ["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"] `shouldBe` "fgij"
