//
//  ConsentDocument.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/7/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation
import ResearchKit

class ConsentDocument: ORKConsentDocument {
    
    // Test Data
    let ipsum = [
        "Vivamus laoreet erat sit amet tincidunt scelerisque. Maecenas odio sapien, molestie eu vulputate sodales, tincidunt at neque. Nunc venenatis velit et ligula dictum, eget accumsan felis consectetur. Donec scelerisque fermentum vestibulum. Nam molestie finibus mauris, id congue lectus ultrices eu. Nunc et odio vitae dui interdum dictum. Proin sagittis leo quam. Proin vulputate massa ac orci pulvinar, eget rhoncus urna congue. Sed ut vehicula tellus, eget scelerisque enim. Cras lobortis diam at faucibus scelerisque. Curabitur pharetra arcu erat, nec tincidunt mi eleifend ut. Nunc suscipit risus vitae consectetur sodales. Aenean vitae lectus odio. Phasellus diam orci, accumsan non elementum at, finibus condimentum mauris. Nullam est enim, rhoncus a rutrum sed, laoreet a magna.",
        "Duis euismod sollicitudin elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at pharetra sapien. Pellentesque cursus laoreet interdum. Nunc mi sapien, congue vel eleifend in, luctus sit amet massa. Nam tempus metus nec mauris bibendum, vel suscipit quam aliquet. Vestibulum sagittis mi et tempus iaculis. Integer varius eros non sagittis elementum. Proin dictum magna sit amet nulla volutpat posuere eget ac mi. Cras aliquam tristique velit nec porttitor. Integer nulla ligula, vestibulum a ullamcorper non, volutpat non nibh. Integer auctor ipsum id leo pharetra, vitae dapibus augue sagittis. Proin ut diam non orci vulputate rutrum a et nulla. Maecenas in varius augue, eu pretium metus. In auctor ornare augue ac sodales.",
        "Aenean in ligula quis arcu rhoncus tristique. Donec ut nisl suscipit augue ornare venenatis. Suspendisse commodo nibh dignissim, congue justo quis, ultrices sapien. Aliquam at lacinia ante. Sed venenatis quam eget dui lobortis, non ullamcorper tellus molestie. Quisque tempus fringilla velit, et viverra odio accumsan quis. Suspendisse potenti. Nullam ac dolor nunc. Pellentesque nec scelerisque risus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus consectetur efficitur rutrum. Suspendisse in arcu id ex luctus aliquam quis at quam.",
        "Maecenas quis varius massa. Nam in dapibus turpis, ut varius eros. Proin a ex enim. Sed faucibus magna vel tincidunt facilisis. Donec id ligula vel mi suscipit sollicitudin. Nulla non magna blandit, semper augue vel, sagittis dui. Curabitur quis rutrum ex. Sed ipsum odio, mattis et dignissim sit amet, volutpat et turpis. Sed quis placerat orci. Duis vitae bibendum diam.",
        "Sed nec tortor sapien. Quisque tempor scelerisque vulputate. Nulla eget consequat urna. Aliquam tempus sagittis orci vel tempus. Mauris porta ante sed maximus iaculis. Etiam elit purus, pretium nec ipsum non, aliquam commodo erat. Aliquam sagittis, nibh at porta pellentesque, libero purus finibus nulla, sed consectetur tellus sem non nisl. Duis eu sollicitudin orci. Quisque tincidunt feugiat sapien ac accumsan. Nullam vitae fringilla quam.",
        "Integer tristique, nulla nec auctor consectetur, justo dolor sagittis erat, vel laoreet erat turpis vitae dui. Praesent purus tellus, eleifend faucibus sapien id, egestas mollis turpis. Fusce enim lorem, ornare quis ligula a, mattis feugiat diam. Praesent ullamcorper fringilla urna sollicitudin convallis. Curabitur eget dapibus ipsum, ac suscipit mauris. In hac habitasse platea dictumst. Vestibulum non hendrerit ex.",
        "Nulla convallis ligula ornare efficitur ullamcorper. Vivamus erat enim, malesuada sit amet dolor ac, tristique blandit felis. Praesent a ante ac nisi tempor elementum. Mauris ligula tellus, porttitor eu vehicula eget, condimentum sed nisi. Donec pharetra lacus tincidunt sapien dignissim iaculis. Duis id ultrices tortor, at congue dolor. Donec consequat fringilla leo, eu congue nulla suscipit non.",
        "Sed convallis, ligula vel egestas commodo, mauris nisl tincidunt arcu, id tristique est nunc sit amet felis. Curabitur tortor dolor, ullamcorper vitae pulvinar egestas, venenatis a sem. Cras sit amet maximus magna. Vivamus auctor nisi quis felis mattis, vel sagittis purus pulvinar. Nunc tristique nibh mauris, at eleifend arcu sodales nec. Curabitur rhoncus rutrum metus, ac pretium ante tempor sed. Sed vehicula placerat felis, nec interdum nisl fringilla eu. Nunc iaculis sit amet massa fringilla rhoncus. Maecenas consequat, risus eget commodo suscipit, lorem ex condimentum orci, et sollicitudin nisi eros sed lectus. Sed at erat nisl. Nunc venenatis mi tellus, vitae congue erat dictum a."
    ]
    
    
    override init() {
        super.init()
        
        title = NSLocalizedString("Research Health Study Consent Form", comment: "")
        
        let sectionTypes : [ORKConsentSectionType] = [
            .Overview,
            .DataGathering,
            .Privacy,
            .DataUse,
            .TimeCommitment,
            .StudySurvey,
            .StudyTasks,
            .Withdrawing
        ]
        
        sections = zip(sectionTypes, ipsum).map { type, info in
            
            let section = ORKConsentSection(type: type)
            
            let localizedIpsum = NSLocalizedString(info, comment: "")
            let localizedSummary = localizedIpsum.componentsSeparatedByString(".")[0] + "."
            
            section.summary = localizedSummary
            section.content = localizedIpsum
            
            return section
            
        }
        
        let signature = ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        addSignature(signature)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ORKConsentSectionType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .Overview:
            return "Overview"
            
        case .DataGathering:
            return "DataGathering"
            
        case .Privacy:
            return "Privacy"
            
        case .DataUse:
            return "DataUse"
            
        case .TimeCommitment:
            return "TimeCommitment"
            
        case .StudySurvey:
            return "StudySurvey"
            
        case .StudyTasks:
            return "StudyTasks"
            
        case .Withdrawing:
            return "Withdrawing"
            
        case .Custom:
            return "Custom"
            
        case .OnlyInDocument:
            return "OnlyInDocument"
        }
    }
}