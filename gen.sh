cat vb_unhighlight.json | jq '.steps' > tmp_steps.json

for i in {1..45}
do
jqArg="$jqArg tmp_steps.json"
done

cat ./vb_init_config.json | jq '.steps' | jq -s add - $jqArg > tmp.json

cat << EOF > output.json
{
  "title": "remove highlights",
  "steps":
EOF

cat tmp.json >> output.json

echo "}" >> output.json

rm -rf tmp.json tmp_steps.json