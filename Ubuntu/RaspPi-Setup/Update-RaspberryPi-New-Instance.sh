# Create New User
# Update Profile
# Update Shell / bash
     # 1. Take ownership of /etc/profile.d/apps-bin-path.sh
     /FilePermissionsChangeTo-PriorToMove.sh
     # 2. Copy over /etc/profile.d/apps-bin-path.sh
     MoveFiles-ForProfile.sh
     # 3. Restore ownership of /etc/profile.d/apps-bin-path.sh
     /FilePermisionsChangeReset-PostMove.sh
# Install dotNet Core
