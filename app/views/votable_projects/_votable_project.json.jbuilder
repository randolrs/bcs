json.extract! votable_project, :id, :headline, :sub_headline, :reason_selected, :additional_information, :created_at, :updated_at
json.url votable_project_url(votable_project, format: :json)
