private
computeRelativeColorFor: aFAMIXClass withBrightnessFrom: references

	^ (self computeColorFor: aFAMIXClass) adjustBrightness: (references select: [ :assoc | assoc key = aFAMIXClass or: [ assoc value = aFAMIXClass ] ]) size / ({(references collect: #key) asBag sortedCounts first key.  (references collect: #value) asBag sortedCounts first key} max) * -1