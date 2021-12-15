Assets {
  Id: 6907896801157901322
  Name: "AdvancedFlowers5"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 13574242069172392238
      Objects {
        Id: 13574242069172392238
        Name: "AdvancedFlowers5"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 9522309597970367925
        ChildIds: 5919908733518702135
        ChildIds: 2489136421185338430
        ChildIds: 8809950339836570861
        ChildIds: 6889705872886417966
        UnregisteredParameters {
          Overrides {
            Name: "cs:Type"
            String: "Flower"
          }
          Overrides {
            Name: "cs:Visual"
            ObjectReference {
              SubObjectId: 6258939578426429010
            }
          }
          Overrides {
            Name: "cs:Health"
            Int: 600
          }
          Overrides {
            Name: "cs:Stamina"
            Int: 300
          }
          Overrides {
            Name: "cs:Magic"
            Int: 300
          }
          Overrides {
            Name: "cs:MagicPer2"
            Int: 60
          }
          Overrides {
            Name: "cs:StaminaPer2"
            Int: 60
          }
          Overrides {
            Name: "cs:HealthPer2"
            Int: 25
          }
          Overrides {
            Name: "cs:Cost1"
            Int: 150
          }
          Overrides {
            Name: "cs:Cost2"
            Int: 300
          }
          Overrides {
            Name: "cs:Cost3"
            Int: 350
          }
          Overrides {
            Name: "cs:Cost3:tooltip"
            String: "7 * healthPer2 * 2"
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Equipment {
          SocketName: "pelvis"
          PickupTrigger {
            SelfId: 841534158063459245
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9522309597970367925
        Name: "ServerContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13574242069172392238
        ChildIds: 17762150573865761698
        ChildIds: 2674902902393994325
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        NetworkContext {
          Type: Server
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 17762150573865761698
        Name: "FlowerEquip"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9522309597970367925
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 12269640500723341667
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2674902902393994325
        Name: "FlowerLogic"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9522309597970367925
        UnregisteredParameters {
          Overrides {
            Name: "cs:QuickCast"
            ObjectReference {
              SubObjectId: 5610374673043739474
            }
          }
          Overrides {
            Name: "cs:PowerCast"
            ObjectReference {
              SubObjectId: 9141415743232429155
            }
          }
          Overrides {
            Name: "cs:Meditate"
            ObjectReference {
              SubObjectId: 11626558946568358950
            }
          }
          Overrides {
            Name: "cs:GameStateAPI"
            AssetReference {
              Id: 15612790520903086079
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 1629359128708971938
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5919908733518702135
        Name: "abilities"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13574242069172392238
        ChildIds: 5610374673043739474
        ChildIds: 9141415743232429155
        ChildIds: 11626558946568358950
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5610374673043739474
        Name: "QuickCast"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5919908733518702135
        UnregisteredParameters {
          Overrides {
            Name: "cs:Power"
            Float: 150
          }
          Overrides {
            Name: "cs:Cost"
            Int: 150
          }
          Overrides {
            Name: "cs:Power:tooltip"
            String: "Damage value applied to a player hit by hitbox trigger."
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Ability {
          IsEnabled: true
          CastPhaseSettings {
            Duration: 1
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:aim"
            }
          }
          ExecutePhaseSettings {
            Duration: 0.1
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:aim"
            }
          }
          RecoveryPhaseSettings {
            Duration: 0.3
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:none"
            }
          }
          CooldownPhaseSettings {
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:none"
            }
          }
          CanBePrevented: true
          KeyBinding_v2 {
            Value: "mc:egameaction:primaryaction"
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9141415743232429155
        Name: "PowerCast"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5919908733518702135
        UnregisteredParameters {
          Overrides {
            Name: "cs:Power"
            Float: 300
          }
          Overrides {
            Name: "cs:Cost"
            Int: 300
          }
          Overrides {
            Name: "cs:Power:tooltip"
            String: "Damage value applied to a player hit by hitbox trigger."
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Ability {
          IsEnabled: true
          CastPhaseSettings {
            Duration: 3
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:aim"
            }
          }
          ExecutePhaseSettings {
            Duration: 0.2
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:aim"
            }
          }
          RecoveryPhaseSettings {
            Duration: 0.3
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:none"
            }
          }
          CooldownPhaseSettings {
            Duration: 1
            CanMove: true
            CanJump: true
            CanRotate: true
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:none"
            }
          }
          CanBePrevented: true
          KeyBinding_v2 {
            Value: "mc:egameaction:secondaryaction"
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 11626558946568358950
        Name: "Meditate"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5919908733518702135
        UnregisteredParameters {
          Overrides {
            Name: "cs:Power"
            Float: 100
          }
          Overrides {
            Name: "cs:Cost"
            Int: 0
          }
          Overrides {
            Name: "cs:Power:tooltip"
            String: "Damage value applied to a player hit by hitbox trigger."
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Ability {
          IsEnabled: true
          CastPhaseSettings {
            Duration: 1
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:aim"
            }
          }
          ExecutePhaseSettings {
            Duration: 6
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:aim"
            }
          }
          RecoveryPhaseSettings {
            Duration: 1
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:none"
            }
          }
          CooldownPhaseSettings {
            CanMove: true
            CanJump: true
            CanRotate: true
            PreventOtherAbilities: true
            IsTargetDataUpdated: true
            Facing_V2 {
              Value: "mc:eabilitysetfacing:none"
            }
          }
          CanBePrevented: true
          KeyBinding_v2 {
            Value: "mc:egameaction:extraaction_04"
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2489136421185338430
        Name: "IKAnimations"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13574242069172392238
        UnregisteredParameters {
          Overrides {
            Name: "cs:ik"
            ObjectReference {
              SubObjectId: 8809950339836570861
            }
          }
          Overrides {
            Name: "cs:abilities"
            ObjectReference {
              SubObjectId: 5919908733518702135
            }
          }
          Overrides {
            Name: "cs:BodyAnchor"
            AssetReference {
              Id: 4716804444574403120
            }
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 1293911671925627851
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 8809950339836570861
        Name: "ik"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13574242069172392238
        ChildIds: 8844220765078610624
        ChildIds: 6695629219989072881
        ChildIds: 14585674998597240732
        ChildIds: 16879280501306376883
        ChildIds: 9024949876371066750
        ChildIds: 4416444872855748179
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 8844220765078610624
        Name: "QuickCast_cast_left"
        Transform {
          Location {
            Y: -30
            Z: 100
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8809950339836570861
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        IKAnchor {
          AimOffset {
            X: -26
          }
          IKAnchorType {
            Value: "mc:eikanchortype:lefthand"
          }
          BlendWeight: 1
          BlendInTime: 0.2
          BlendOutTime: 0.3
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6695629219989072881
        Name: "QuickCast_cast_right"
        Transform {
          Location {
            Y: 30
            Z: 100
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8809950339836570861
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        IKAnchor {
          AimOffset {
            X: -26
          }
          IKAnchorType {
            Value: "mc:eikanchortype:righthand"
          }
          BlendWeight: 1
          BlendInTime: 0.2
          BlendOutTime: 0.3
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14585674998597240732
        Name: "PowerCast_cast_left"
        Transform {
          Location {
            Y: -30
            Z: 100
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8809950339836570861
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        IKAnchor {
          AimOffset {
            X: -26
          }
          IKAnchorType {
            Value: "mc:eikanchortype:lefthand"
          }
          BlendWeight: 1
          BlendInTime: 0.2
          BlendOutTime: 0.3
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 16879280501306376883
        Name: "PowerCast_cast_right"
        Transform {
          Location {
            Y: 30
            Z: 100
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8809950339836570861
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        IKAnchor {
          AimOffset {
            X: -26
          }
          IKAnchorType {
            Value: "mc:eikanchortype:righthand"
          }
          BlendWeight: 1
          BlendInTime: 0.2
          BlendOutTime: 0.3
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9024949876371066750
        Name: "Meditate_cast_right"
        Transform {
          Location {
            X: 20
            Y: 40
            Z: 80
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8809950339836570861
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        IKAnchor {
          AimOffset {
            X: -26
          }
          IKAnchorType {
            Value: "mc:eikanchortype:righthand"
          }
          BlendWeight: 1
          BlendInTime: 0.5
          BlendOutTime: 1
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4416444872855748179
        Name: "Meditate_execute_right"
        Transform {
          Location {
            X: 20
            Y: 40
            Z: 80
          }
          Rotation {
            Pitch: 90
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 8809950339836570861
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        IKAnchor {
          AimOffset {
            X: -26
          }
          IKAnchorType {
            Value: "mc:eikanchortype:righthand"
          }
          BlendWeight: 1
          BlendOutTime: 0.3
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6889705872886417966
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13574242069172392238
        ChildIds: 8628886095975931263
        ChildIds: 4856853742509373457
        ChildIds: 13831199862395227742
        ChildIds: 13511061744678159582
        ChildIds: 6258939578426429010
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        NetworkContext {
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 8628886095975931263
        Name: "CustomClientPickup"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6889705872886417966
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 12797426400389748283
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4856853742509373457
        Name: "HealCloud"
        Transform {
          Location {
            X: 20
            Y: 40
            Z: 85
          }
          Rotation {
          }
          Scale {
            X: 0.2
            Y: 0.2
            Z: 0.1
          }
        }
        ParentId: 6889705872886417966
        UnregisteredParameters {
          Overrides {
            Name: "bp:Color A"
            Color {
              G: 1
              A: 1
            }
          }
          Overrides {
            Name: "bp:Color B"
            Color {
              R: 0.131
              G: 0.0895349905
              B: 0.0517449975
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceoff"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 12895515524351229973
          }
          TeamSettings {
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13831199862395227742
        Name: "HealVFX"
        Transform {
          Location {
            Z: 150
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6889705872886417966
        ChildIds: 13826532978650461187
        ChildIds: 6182482809163561714
        ChildIds: 10305029697522531609
        UnregisteredParameters {
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceoff"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13826532978650461187
        Name: "MCG: All - Crosses"
        Transform {
          Location {
            Z: 22.112854
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13831199862395227742
        ChildIds: 5269349743331845692
        ChildIds: 1758351914235052594
        ChildIds: 16242140597386853244
        ChildIds: 18030113379277439523
        ChildIds: 768724576220432818
        ChildIds: 13586264993298552482
        ChildIds: 47063247734587615
        UnregisteredParameters {
          Overrides {
            Name: "bp:Element A Shape"
            Int: 7
          }
          Overrides {
            Name: "bp:Element A Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator1"
            }
          }
          Overrides {
            Name: "bp:Count"
            Int: 4
          }
          Overrides {
            Name: "bp:Scale"
            Float: 0.356335759
          }
          Overrides {
            Name: "bp:Distance"
            Float: 148.773193
          }
          Overrides {
            Name: "bp:Dual Texture"
            Bool: false
          }
          Overrides {
            Name: "bp:Element B Shape"
            Int: 6
          }
          Overrides {
            Name: "bp:Coloring Method"
            Enum {
              Value: "mc:emccoloringmethod:3"
            }
          }
          Overrides {
            Name: "bp:Top Color"
            Color {
              R: 1
              G: 0.0299999714
              B: 0.0299999714
              A: 1
            }
          }
          Overrides {
            Name: "bp:Middle Color"
            Color {
              R: 1
              G: 0.199999988
              B: 0.199999988
              A: 1
            }
          }
          Overrides {
            Name: "bp:Circle Rotation Speed"
            Float: 20
          }
          Overrides {
            Name: "bp:Fade Start"
            Float: 0
          }
          Overrides {
            Name: "bp:Fade Softness"
            Float: 0.0393316373
          }
          Overrides {
            Name: "bp:Border Edge Fade"
            Bool: true
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 14388349938129413296
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5269349743331845692
        Name: "Magic Circle - Green Frame"
        Transform {
          Location {
            Z: 1.78159332
          }
          Rotation {
          }
          Scale {
            X: 1.15832913
            Y: 1.15832913
            Z: 1.15832913
          }
        }
        ParentId: 13826532978650461187
        UnregisteredParameters {
          Overrides {
            Name: "bp:Element A Shape"
            Int: 8
          }
          Overrides {
            Name: "bp:Element A Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Count"
            Int: 1
          }
          Overrides {
            Name: "bp:Scale"
            Float: 1.76229644
          }
          Overrides {
            Name: "bp:Distance"
            Float: 0
          }
          Overrides {
            Name: "bp:Dual Texture"
            Bool: true
          }
          Overrides {
            Name: "bp:Element B Shape"
            Int: 1
          }
          Overrides {
            Name: "bp:Coloring Method"
            Enum {
              Value: "mc:emccoloringmethod:3"
            }
          }
          Overrides {
            Name: "bp:Top Color"
            Color {
              G: 0.399999976
              B: 0.0423841439
              A: 1
            }
          }
          Overrides {
            Name: "bp:Middle Color"
            Color {
              G: 0.99
              B: 0.124569513
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element Type"
            Enum {
              Value: "mc:emcshapes:3"
            }
          }
          Overrides {
            Name: "bp:Element A Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Element A Repetitions U"
            Float: 4
          }
          Overrides {
            Name: "bp:Border Edge Fade"
            Bool: false
          }
          Overrides {
            Name: "bp:Element Rotation"
            Float: -0
          }
          Overrides {
            Name: "bp:Offset Rotation"
            Float: -45
          }
          Overrides {
            Name: "bp:Bottom Color"
            Color {
              R: 0.227152169
              G: 0.98
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element B Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Element B Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Alternate Blend"
            Bool: true
          }
          Overrides {
            Name: "bp:Element Blend"
            Float: 0
          }
          Overrides {
            Name: "bp:Alpha Blending"
            Bool: true
          }
          Overrides {
            Name: "bp:Circle Thickness"
            Float: 19.3691788
          }
          Overrides {
            Name: "bp:Circle Rotation Speed"
            Float: 20
          }
          Overrides {
            Name: "bp:Scroll Speed"
            Float: 0
          }
          Overrides {
            Name: "bp:Rotation Speed"
            Float: 0
          }
          Overrides {
            Name: "bp:Emissive"
            Float: 6.35401964
          }
          Overrides {
            Name: "bp:Fade Start"
            Float: 0
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 14388349938129413296
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 1758351914235052594
        Name: "Magic Circle - Sci Fi Scale In"
        Transform {
          Location {
            Z: -14.8396835
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13826532978650461187
        UnregisteredParameters {
          Overrides {
            Name: "bp:Element A Shape"
            Int: 9
          }
          Overrides {
            Name: "bp:Element A Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Count"
            Int: 1
          }
          Overrides {
            Name: "bp:Scale"
            Float: 1.76229644
          }
          Overrides {
            Name: "bp:Distance"
            Float: 0
          }
          Overrides {
            Name: "bp:Dual Texture"
            Bool: true
          }
          Overrides {
            Name: "bp:Element B Shape"
            Int: 1
          }
          Overrides {
            Name: "bp:Coloring Method"
            Enum {
              Value: "mc:emccoloringmethod:3"
            }
          }
          Overrides {
            Name: "bp:Top Color"
            Color {
              G: 0.0649005547
              B: 0.98
              A: 1
            }
          }
          Overrides {
            Name: "bp:Middle Color"
            Color {
              G: 0.419602603
              B: 0.99
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element Type"
            Enum {
              Value: "mc:emcshapes:3"
            }
          }
          Overrides {
            Name: "bp:Element A Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Element A Repetitions U"
            Float: 4
          }
          Overrides {
            Name: "bp:Border Edge Fade"
            Bool: false
          }
          Overrides {
            Name: "bp:Element Rotation"
            Float: -0
          }
          Overrides {
            Name: "bp:Offset Rotation"
            Float: -45
          }
          Overrides {
            Name: "bp:Bottom Color"
            Color {
              R: 0.399999976
              G: 0.821192086
              B: 1
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element B Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Element B Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Alternate Blend"
            Bool: true
          }
          Overrides {
            Name: "bp:Element Blend"
            Float: 0
          }
          Overrides {
            Name: "bp:Alpha Blending"
            Bool: true
          }
          Overrides {
            Name: "bp:Circle Thickness"
            Float: 15.5338593
          }
          Overrides {
            Name: "bp:Circle Rotation Speed"
            Float: 20
          }
          Overrides {
            Name: "bp:Scroll Speed"
            Float: 1
          }
          Overrides {
            Name: "bp:Rotation Speed"
            Float: -0.25853771
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 14388349938129413296
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 16242140597386853244
        Name: "Magic Circle - Inner"
        Transform {
          Location {
            Z: -15.6815796
          }
          Rotation {
          }
          Scale {
            X: 0.6
            Y: 0.6
            Z: 0.6
          }
        }
        ParentId: 13826532978650461187
        UnregisteredParameters {
          Overrides {
            Name: "bp:Element A Shape"
            Int: 6
          }
          Overrides {
            Name: "bp:Element A Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Count"
            Int: 1
          }
          Overrides {
            Name: "bp:Scale"
            Float: 2
          }
          Overrides {
            Name: "bp:Distance"
            Float: 0
          }
          Overrides {
            Name: "bp:Dual Texture"
            Bool: true
          }
          Overrides {
            Name: "bp:Element B Shape"
            Int: 6
          }
          Overrides {
            Name: "bp:Coloring Method"
            Enum {
              Value: "mc:emccoloringmethod:3"
            }
          }
          Overrides {
            Name: "bp:Top Color"
            Color {
              R: 0.0116556929
              B: 0.88
              A: 1
            }
          }
          Overrides {
            Name: "bp:Middle Color"
            Color {
              G: 0.288807631
              B: 0.89
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element Type"
            Enum {
              Value: "mc:emcshapes:3"
            }
          }
          Overrides {
            Name: "bp:Element A Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator1"
            }
          }
          Overrides {
            Name: "bp:Element A Repetitions U"
            Float: 4
          }
          Overrides {
            Name: "bp:Border Edge Fade"
            Bool: false
          }
          Overrides {
            Name: "bp:Element Rotation"
            Float: -0
          }
          Overrides {
            Name: "bp:Offset Rotation"
            Float: -45
          }
          Overrides {
            Name: "bp:Bottom Color"
            Color {
              R: 0.63
              G: 0.882384062
              B: 1
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element B Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator1"
            }
          }
          Overrides {
            Name: "bp:Element B Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Alternate Blend"
            Bool: true
          }
          Overrides {
            Name: "bp:Alpha Blending"
            Bool: true
          }
          Overrides {
            Name: "bp:Circle Thickness"
            Float: 14.9239807
          }
          Overrides {
            Name: "bp:Emissive"
            Float: 17.7233925
          }
          Overrides {
            Name: "bp:Scroll Speed B"
            Float: 0
          }
          Overrides {
            Name: "bp:Rotation Speed B"
            Float: 0
          }
          Overrides {
            Name: "bp:Element Rotation Speed"
            Float: -5.25186157
          }
          Overrides {
            Name: "bp:Color Offset Middle"
            Float: 0.811872661
          }
          Overrides {
            Name: "bp:Color Offset Top"
            Float: 0.559791803
          }
          Overrides {
            Name: "bp:Element Blend"
            Float: 0
          }
          Overrides {
            Name: "bp:Fade Axis"
            Enum {
              Value: "mc:emcfadeaxisxy:0"
            }
          }
          Overrides {
            Name: "bp:Fade Start"
            Float: 0
          }
          Overrides {
            Name: "bp:Outline"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 14388349938129413296
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 18030113379277439523
        Name: "Magic Circle - Bue Ring"
        Transform {
          Location {
            Z: -5.30485535
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13826532978650461187
        UnregisteredParameters {
          Overrides {
            Name: "bp:Element A Shape"
            Int: 1
          }
          Overrides {
            Name: "bp:Element A Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Count"
            Int: 1
          }
          Overrides {
            Name: "bp:Scale"
            Float: 2.1
          }
          Overrides {
            Name: "bp:Distance"
            Float: 0
          }
          Overrides {
            Name: "bp:Dual Texture"
            Bool: true
          }
          Overrides {
            Name: "bp:Element B Shape"
            Int: 1
          }
          Overrides {
            Name: "bp:Coloring Method"
            Enum {
              Value: "mc:emccoloringmethod:3"
            }
          }
          Overrides {
            Name: "bp:Top Color"
            Color {
              G: 0.0649005547
              B: 0.98
              A: 1
            }
          }
          Overrides {
            Name: "bp:Middle Color"
            Color {
              G: 0.00615853025
              B: 0.929999948
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element Type"
            Enum {
              Value: "mc:emcshapes:3"
            }
          }
          Overrides {
            Name: "bp:Element A Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Element A Repetitions U"
            Float: 4
          }
          Overrides {
            Name: "bp:Border Edge Fade"
            Bool: false
          }
          Overrides {
            Name: "bp:Element Rotation"
            Float: -0
          }
          Overrides {
            Name: "bp:Offset Rotation"
            Float: -45
          }
          Overrides {
            Name: "bp:Bottom Color"
            Color {
              R: 0.0312584527
              B: 0.590000033
              A: 1
            }
          }
          Overrides {
            Name: "bp:Element B Theme"
            Enum {
              Value: "mc:emagiccirclealltypes:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Element B Set"
            Enum {
              Value: "mc:emagiccircleselementtype:newenumerator2"
            }
          }
          Overrides {
            Name: "bp:Alternate Blend"
            Bool: true
          }
          Overrides {
            Name: "bp:Element Blend"
            Float: 0
          }
          Overrides {
            Name: "bp:Alpha Blending"
            Bool: true
          }
          Overrides {
            Name: "bp:Circle Thickness"
            Float: 21.4292984
          }
          Overrides {
            Name: "bp:Circle Rotation Speed"
            Float: 20
          }
          Overrides {
            Name: "bp:Scroll Speed"
            Float: 0
          }
          Overrides {
            Name: "bp:Color Offset Bottom"
            Float: 1
          }
          Overrides {
            Name: "bp:Emissive"
            Float: 1.46011198
          }
          Overrides {
            Name: "bp:Fade Start"
            Float: 0
          }
          Overrides {
            Name: "bp:Fade Axis"
            Enum {
              Value: "mc:emcfadeaxisxy:29"
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 14388349938129413296
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 768724576220432818
        Name: "Resurrection VFX"
        Transform {
          Location {
            Z: -1.94848633
          }
          Rotation {
          }
          Scale {
            X: 1.2
            Y: 1.2
            Z: 1.2
          }
        }
        ParentId: 13826532978650461187
        ChildIds: 1837832555155017582
        ChildIds: 9368285007591768046
        ChildIds: 15940792170607140014
        UnregisteredParameters {
          Overrides {
            Name: "bp:Density"
            Float: 1.31157517
          }
          Overrides {
            Name: "bp:Particle Scale Multiplier"
            Float: 4.0318737
          }
          Overrides {
            Name: "bp:Color"
            Color {
              G: 1
              B: 0.125827789
              A: 1
            }
          }
          Overrides {
            Name: "bp:Emissive Boost"
            Float: 1.46011198
          }
          Overrides {
            Name: "bp:Enable Spiral"
            Bool: false
          }
          Overrides {
            Name: "bp:Enable Base Rays"
            Bool: true
          }
          Overrides {
            Name: "bp:Enable Beam"
            Bool: true
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 17265577904957117337
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 1837832555155017582
        Name: "Treasure Ray Burst"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.833333313
            Y: 0.833333313
            Z: 0.833333313
          }
        }
        ParentId: 768724576220432818
        UnregisteredParameters {
          Overrides {
            Name: "bp:Density"
            Float: 6.78910971
          }
          Overrides {
            Name: "bp:Emissive Boost"
            Float: 9.69339848
          }
          Overrides {
            Name: "bp:Ray Length"
            Float: 0.518562
          }
          Overrides {
            Name: "bp:Color"
            Color {
              G: 0.97
              B: 0.102781564
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 17365099617506282650
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 9368285007591768046
        Name: "Health Spiral VFX"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 0.833333313
            Y: 0.833333313
            Z: 0.833333313
          }
        }
        ParentId: 768724576220432818
        UnregisteredParameters {
          Overrides {
            Name: "bp:Life"
            Float: 0.921764791
          }
          Overrides {
            Name: "bp:Particle Scale Multiplier"
            Float: 1.71740568
          }
          Overrides {
            Name: "bp:Spiral Speed"
            Float: 6.04445505
          }
          Overrides {
            Name: "bp:Ring Life"
            Float: 1.08368599
          }
          Overrides {
            Name: "bp:Emissive Boost"
            Float: 3.18808556
          }
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.161258101
              G: 1
              B: 0.149999976
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 17491952894727065299
          }
          TeamSettings {
          }
          Vfx {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 15940792170607140014
        Name: "Meta Fantasy Heal 02 SFX"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 768724576220432818
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        AudioInstance {
          AudioAsset {
            Id: 4536349589915510544
          }
          Volume: 1
          Falloff: -1
          Radius: -1
          EnableOcclusion: true
          IsSpatializationEnabled: true
          IsAttenuationEnabled: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13586264993298552482
        Name: "Glow Shape Decal"
        Transform {
          Location {
            Z: -32.7390442
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 0.506847143
          }
        }
        ParentId: 13826532978650461187
        UnregisteredParameters {
          Overrides {
            Name: "bp:Shape Index"
            Int: 2
          }
          Overrides {
            Name: "bp:Shape Fill"
            Float: 0.604515851
          }
          Overrides {
            Name: "bp:Emissive Boost"
            Float: 4.22393656
          }
          Overrides {
            Name: "bp:Color"
            Color {
              G: 0.97
              B: 0.102781564
              A: 1
            }
          }
          Overrides {
            Name: "bp:Enable Noise"
            Bool: true
          }
          Overrides {
            Name: "bp:Fade Time"
            Float: 0
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 6412508969258821711
          }
          TeamSettings {
          }
          DecalBP {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 47063247734587615
        Name: "Point Light"
        Transform {
          Location {
            Z: -1.94848633
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13826532978650461187
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Light {
          Intensity: 52.7265244
          Color {
            R: 0.0199999809
            G: 1
            B: 0.0264900923
            A: 1
          }
          CastShadows: true
          VolumetricIntensity: 52.7265244
          TeamSettings {
          }
          Light {
            Temperature: 6500
            LocalLight {
              AttenuationRadius: 462.079041
              PointLight {
                SourceRadius: 20
                SoftSourceRadius: 20
                FallOffExponent: 8
                UseFallOffExponent: true
              }
            }
            MaxDrawDistance: 5000
            MaxDistanceFadeRange: 1000
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6182482809163561714
        Name: "BeamDown"
        Transform {
          Location {
          }
          Rotation {
            Roll: 180
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13831199862395227742
        UnregisteredParameters {
          Overrides {
            Name: "bp:Color"
            Color {
              R: 1
              A: 1
            }
          }
          Overrides {
            Name: "bp:Spiral Color"
            Color {
              R: 1
              A: 1
            }
          }
          Overrides {
            Name: "bp:Looping"
            Bool: true
          }
          Overrides {
            Name: "bp:Loop Duration"
            Float: 2
          }
          Overrides {
            Name: "bp:Teleport Duration"
            Float: 2
          }
          Overrides {
            Name: "bp:Enable Central Flare Element"
            Bool: false
          }
          Overrides {
            Name: "bp:Particle Color"
            Color {
              R: 1
              A: 1
            }
          }
          Overrides {
            Name: "bp:Spiral Ground Element Color"
            Color {
              R: 1
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 8504763977510659995
          }
          TeamSettings {
          }
          Vfx {
            AutoPlay: true
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10305029697522531609
        Name: "CircleController"
        Transform {
          Location {
            Z: -150
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 13831199862395227742
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 15566180742455915452
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13511061744678159582
        Name: "FlowerAnimation"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6889705872886417966
        UnregisteredParameters {
          Overrides {
            Name: "cs:HealVFX"
            ObjectReference {
              SubObjectId: 13831199862395227742
            }
          }
          Overrides {
            Name: "cs:QuickCast"
            ObjectReference {
              SubObjectId: 5610374673043739474
            }
          }
          Overrides {
            Name: "cs:PowerCast"
            ObjectReference {
              SubObjectId: 9141415743232429155
            }
          }
          Overrides {
            Name: "cs:HealCloud"
            ObjectReference {
              SubObjectId: 4856853742509373457
            }
          }
          Overrides {
            Name: "cs:Meditate"
            ObjectReference {
              SubObjectId: 11626558946568358950
            }
          }
          Overrides {
            Name: "cs:LongFlowerAudio"
            AssetReference {
              Id: 14414096218688040566
            }
          }
          Overrides {
            Name: "cs:FastFlowerAudio"
            AssetReference {
              Id: 1596126356321612296
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 6348676014690993965
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 6258939578426429010
        Name: "Flowers"
        Transform {
          Location {
            Z: -100
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6889705872886417966
        ChildIds: 3103997494788857837
        ChildIds: 10651619282687083805
        ChildIds: 11853347864834745722
        ChildIds: 14431233675601768277
        ChildIds: 13182560220122156901
        ChildIds: 8458577165164619901
        ChildIds: 191130760171279241
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 3103997494788857837
        Name: "RotateScript"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6258939578426429010
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 8187284665203669586
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 10651619282687083805
        Name: "Flower1"
        Transform {
          Location {
            X: 200
          }
          Rotation {
          }
          Scale {
            X: 0.04
            Y: 0.04
            Z: 0.04
          }
        }
        ParentId: 6258939578426429010
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 14966147011442726154
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 11853347864834745722
        Name: "Flower2"
        Transform {
          Location {
            X: 100
            Y: 173.2
          }
          Rotation {
          }
          Scale {
            X: 0.04
            Y: 0.04
            Z: 0.04
          }
        }
        ParentId: 6258939578426429010
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 9245032317503548010
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 14431233675601768277
        Name: "Flower3"
        Transform {
          Location {
            X: -100
            Y: 173.2
          }
          Rotation {
          }
          Scale {
            X: 0.04
            Y: 0.04
            Z: 0.04
          }
        }
        ParentId: 6258939578426429010
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 14966147011442726154
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13182560220122156901
        Name: "Flower4"
        Transform {
          Location {
            X: -200
          }
          Rotation {
          }
          Scale {
            X: 0.04
            Y: 0.04
            Z: 0.04
          }
        }
        ParentId: 6258939578426429010
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 9245032317503548010
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 8458577165164619901
        Name: "Flower5"
        Transform {
          Location {
            X: -100
            Y: -173.2
          }
          Rotation {
          }
          Scale {
            X: 0.04
            Y: 0.04
            Z: 0.04
          }
        }
        ParentId: 6258939578426429010
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 14966147011442726154
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 191130760171279241
        Name: "Flower6"
        Transform {
          Location {
            X: 100
            Y: -173.2
          }
          Rotation {
          }
          Scale {
            X: 0.04
            Y: 0.04
            Z: 0.04
          }
        }
        ParentId: 6258939578426429010
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 9245032317503548010
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    Assets {
      Id: 12895515524351229973
      Name: "Tornado VFX"
      PlatformAssetType: 6
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_tornado"
      }
    }
    Assets {
      Id: 14388349938129413296
      Name: "Magic Circle Generator Advanced: All VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_magic_circle_generator_all"
      }
    }
    Assets {
      Id: 17265577904957117337
      Name: "Resurrection VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_resurrection"
      }
    }
    Assets {
      Id: 17365099617506282650
      Name: "Treasure Ray Burst"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_Treasure_Rays"
      }
    }
    Assets {
      Id: 17491952894727065299
      Name: "Health Spiral VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_health_spiral"
      }
    }
    Assets {
      Id: 4536349589915510544
      Name: "Meta Fantasy Heal 02 SFX"
      PlatformAssetType: 7
      PrimaryAsset {
        AssetType: "AudioAssetRef"
        AssetId: "sfx_meta_fantasy_heal_02_Cue_ref"
      }
    }
    Assets {
      Id: 6412508969258821711
      Name: "Glow Shape Decal"
      PlatformAssetType: 14
      PrimaryAsset {
        AssetType: "DecalBlueprintAssetRef"
        AssetId: "bp_decal_glow"
      }
    }
    Assets {
      Id: 8504763977510659995
      Name: "Beam Up Teleport VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_Teleporter"
      }
    }
    Assets {
      Id: 14966147011442726154
      Name: "Tree Sakura Hero 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_tree_sakura_hero_01_ref"
      }
    }
    Assets {
      Id: 9245032317503548010
      Name: "Tree Oak 01"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_tree_oak_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 103
}
