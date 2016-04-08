//
//  Consent.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/7/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation
import ResearchKit

var Consent: ORKTask {
    
    var steps : [ORKStep] = [ORKStep]()
    
    let document = ConsentDocument()
    
    // Visual Consent Step
    
    let consentDocument = ConsentDocument()
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: document)
    
    steps += [visualConsentStep]
    
    // Consent Review Step
    
    let signature = consentDocument.signatures!.first! as ORKConsentSignature
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]

    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}