#/usr/bin/env sh

CUR_DEPLOY_DIR=`readlink -f current`
CUR_DEPLOY=$(basename $CUR_DEPLOY_DIR)
if [ "$CUR_DEPLOY" = "green" ]; then
	NEXT_DEPLOY="blue"
else
	NEXT_DEPLOY="green"
fi

echo "Current deploy is '$CUR_DEPLOY', switching to $NEXT_DEPLOY"
ln -snf $NEXT_DEPLOY current

# run app on current
sh ./current/app.sh
