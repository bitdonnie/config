#!/usr/bin/fish

function refresh_session -a token
	set cred_path  ~/.aws/credentials
	
	# We need to remove the old mfa credentials first, but keep the default
	# credentials
	awk '{ if (NF>0) print; else exit }' $cred_path > {$cred_path}_copy
	cat {$cred_path}_copy > $cred_path

	set aws_resp (aws sts get-session-token --serial-number $AWS_MFA_ARN --token-code $token --profile default | jq)
 
 	set aws_access_key_id (echo $aws_resp | jq -r .Credentials.AccessKeyId)
 	set aws_secret_access_key (echo $aws_resp | jq -r .Credentials.SecretAccessKey)
 	set aws_session_token (echo $aws_resp | jq -r .Credentials.SessionToken)
 	set aws_token_expiration (echo $aws_resp | jq -r .Credentials.Expiration)
	
	# write the variables to the config file
	echo \n[mfa] >> $cred_path
	echo "aws_access_key_id =$aws_access_key_id" >> $cred_path 
 	echo "aws_secret_access_key=$aws_secret_access_key" >> $cred_path
 	echo "aws_session_token=$aws_session_token" >> $cred_path
end


function verify_env
	# check if the MFA_ARN variable is set
	if test -z $AWS_MFA_ARN
		echo ---- AWS_MFA_ARN not found
		set_color red; echo INFO: Please set the AWS_MFA_ARN environment variable
		return 1
	end
	
	if test (date '+%s' --date=$AWS_TOKEN_EXPIRATION) -le (date '+%s')
		echo -- Session token expired, enter MFA token:
		read mfa
		refresh_session $mfa
	end
	return
end

function aws_update_mfa 
	if verify_env
		echo -- Session token refreshed
		set_color yellow; echo "INFO: Don't forget to set the AWS_PROFILE to mfa"
	end
end


