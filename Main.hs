{-# LANGUAGE OverloadedStrings #-}

{-# OPTIONS_GHC -fno-warn-simplifiable-class-constraints #-}
import Reflex
import Reflex.Dom
import Data.Text (pack, unpack)
import Text.Read (readMaybe)
import Control.Applicative ((<*>), (<$>))

main :: IO ()
main = mainWidget $ el "div" $ do
  nx <- numberInput
  text " + "
  ny <- numberInput
  text " = "
  let result = zipDynWith (\x y -> (+) <$> x <*> y) nx ny
      resultString = fmap (pack . show) result
  dynText resultString

numberInput :: MonadWidget t m => m (Dynamic t (Maybe Double))
numberInput = do
  n <- textInput $ def & textInputConfig_inputType .~ "number"
                       & textInputConfig_initialValue .~ "0"
  return . fmap (readMaybe . unpack) $ _textInput_value n

