//
//  ConfigurationForAWS.swift
//  OSUBMI
//
//  Created by Taha Topiwala on 4/6/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import AWSCore

func configureCognitoPool(){
    let credentialProvider = AWSCognitoCredentialsProvider(regionType: AWSRegionType.USEast1, identityPoolId: "us-east-1:22e48b4f-6af2-4d58-8478-2478a570256a")
    let configuration = AWSServiceConfiguration(region: AWSRegionType.USEast1, credentialsProvider: credentialProvider)
    AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration
}